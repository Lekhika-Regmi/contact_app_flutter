import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/database_helper.dart';
import '../models/contact_model.dart';

part 'contact_local_datasource.g.dart';

abstract class ContactLocalDataSource {
  Future<List<ContactModel>> getAllContacts();
  Future<ContactModel?> getContactById(int id);
  Future<int> insertContact(ContactModel contact);
  Future<void> updateContact(ContactModel contact);
  Future<void> deleteContact(int id);
  Future<void> clearAllContacts();
}

class ContactLocalDataSourceImpl implements ContactLocalDataSource {
  final DatabaseHelper _databaseHelper;

  ContactLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<List<ContactModel>> getAllContacts() async {
    final db = await _databaseHelper.database;
    final maps = await db.query('contacts', orderBy: 'name ASC');
    return maps.map((map) => ContactModelX.fromDatabase(map)).toList();
  }

  @override
  Future<ContactModel?> getContactById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query('contacts', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return ContactModelX.fromDatabase(maps.first);
    }
    return null;
  }

  @override
  Future<int> insertContact(ContactModel contact) async {
    final db = await _databaseHelper.database;
    return await db.insert('contacts', contact.toDatabase());
  }

  @override
  Future<void> updateContact(ContactModel contact) async {
    final db = await _databaseHelper.database;
    await db.update(
      'contacts',
      contact.toDatabase(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  @override
  Future<void> deleteContact(int id) async {
    final db = await _databaseHelper.database;
    await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> clearAllContacts() async {
    final db = await _databaseHelper.database;
    await db.delete('contacts');
  }
}

@riverpod
ContactLocalDataSource contactLocalDataSource(ContactLocalDataSourceRef ref) {
  return ContactLocalDataSourceImpl(DatabaseHelper());
}
