import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/contact_repository_impl.dart';
import '../../domain/entities/contact.dart';

part 'contact_provider.g.dart';

@riverpod
class ContactNotifier extends _$ContactNotifier {
  @override
  FutureOr<List<Contact>> build() async {
    return await ref.watch(contactRepositoryProvider).getContacts();
  }

  Future<void> addContact(Contact contact) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(contactRepositoryProvider).createContact(contact);
      state = AsyncValue.data(
        await ref.read(contactRepositoryProvider).getContacts(),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateContact(Contact contact) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(contactRepositoryProvider).updateContact(contact);
      state = AsyncValue.data(
        await ref.read(contactRepositoryProvider).getContacts(),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteContact(int id) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(contactRepositoryProvider).deleteContact(id);
      state = AsyncValue.data(
        await ref.read(contactRepositoryProvider).getContacts(),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> syncContacts() async {
    try {
      await ref.read(contactRepositoryProvider).syncContacts();
      state = AsyncValue.data(
        await ref.read(contactRepositoryProvider).getContacts(),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

@riverpod
Future<Contact?> contactById(ContactByIdRef ref, int id) async {
  return await ref.watch(contactRepositoryProvider).getContactById(id);
}
