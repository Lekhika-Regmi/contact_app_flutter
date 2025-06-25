import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/contact_model.dart';

part 'contact_remote_datasource.g.dart';

abstract class ContactRemoteDataSource {
  Future<List<ContactModel>> getContacts();
  Future<ContactModel> createContact(ContactModel contact);
  Future<ContactModel> updateContact(ContactModel contact);
  Future<void> deleteContact(int id);
}

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  final Dio _dio;

  ContactRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ContactModel>> getContacts() async {
    try {
      final response = await _dio.get(ApiEndpoints.contacts);
      final List<dynamic> data = response.data;
      return data.map((json) => ContactModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch contacts: $e');
    }
  }

  @override
  Future<ContactModel> createContact(ContactModel contact) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.contacts,
        data: contact.toJson(),
      );
      return ContactModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create contact: $e');
    }
  }

  @override
  Future<ContactModel> updateContact(ContactModel contact) async {
    try {
      final response = await _dio.put(
        '${ApiEndpoints.contacts}/${contact.id}',
        data: contact.toJson(),
      );
      return ContactModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update contact: $e');
    }
  }

  @override
  Future<void> deleteContact(int id) async {
    try {
      await _dio.delete('${ApiEndpoints.contacts}/$id');
    } catch (e) {
      throw Exception('Failed to delete contact: $e');
    }
  }
}

@riverpod
ContactRemoteDataSource contactRemoteDataSource(
  ContactRemoteDataSourceRef ref,
) {
  return ContactRemoteDataSourceImpl(DioClient().dio);
}
