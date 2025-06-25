import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/contact.dart';
import '../datasources/contact_local_datasource.dart';
import '../datasources/contact_remote_datasource.dart';
import '../models/contact_model.dart';

part 'contact_repository_impl.g.dart';

abstract class ContactRepository {
  Future<List<Contact>> getContacts();
  Future<Contact?> getContactById(int id);
  Future<Contact> createContact(Contact contact);
  Future<Contact> updateContact(Contact contact);
  Future<void> deleteContact(int id);
  Future<void> syncContacts();
}

class ContactRepositoryImpl implements ContactRepository {
  final ContactLocalDataSource _localDataSource;
  final ContactRemoteDataSource _remoteDataSource;

  ContactRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<List<Contact>> getContacts() async {
    final localContacts = await _localDataSource.getAllContacts();
    return localContacts.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Contact?> getContactById(int id) async {
    final contactModel = await _localDataSource.getContactById(id);
    return contactModel?.toEntity();
  }

  @override
  Future<Contact> createContact(Contact contact) async {
    final contactModel = ContactModel(
      name: contact.name,
      phone: contact.phone,
      email: contact.email,
      avatar: contact.avatar,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    final id = await _localDataSource.insertContact(contactModel);
    final savedContact = await _localDataSource.getContactById(id);
    return savedContact!.toEntity();
  }

  @override
  Future<Contact> updateContact(Contact contact) async {
    final contactModel = ContactModel(
      id: contact.id,
      name: contact.name,
      phone: contact.phone,
      email: contact.email,
      avatar: contact.avatar,
      createdAt: contact.createdAt?.toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    await _localDataSource.updateContact(contactModel);
    final updatedContact = await _localDataSource.getContactById(contact.id!);
    return updatedContact!.toEntity();
  }

  @override
  Future<void> deleteContact(int id) async {
    await _localDataSource.deleteContact(id);
  }

  @override
  Future<void> syncContacts() async {
    try {
      final remoteContacts = await _remoteDataSource.getContacts();
      await _localDataSource.clearAllContacts();

      for (final contact in remoteContacts) {
        await _localDataSource.insertContact(contact);
      }
    } catch (e) {
      // Sync failed, continue with local data
      print('Sync failed: $e');
    }
  }
}

@riverpod
ContactRepository contactRepository(ContactRepositoryRef ref) {
  return ContactRepositoryImpl(
    ref.watch(contactLocalDataSourceProvider),
    ref.watch(contactRemoteDataSourceProvider),
  );
}
