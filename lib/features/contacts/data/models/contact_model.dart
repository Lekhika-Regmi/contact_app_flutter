import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/contact.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class ContactModel with _$ContactModel {
  const factory ContactModel({
    int? id,
    required String name,
    required String phone,
    String? email,
    String? avatar,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
}

extension ContactModelX on ContactModel {
  Contact toEntity() {
    return Contact(
      id: id,
      name: name,
      phone: phone,
      email: email,
      avatar: avatar,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
    );
  }

  Map<String, dynamic> toDatabase() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'avatar': avatar,
      'created_at': createdAt ?? DateTime.now().toIso8601String(),
      'updated_at': updatedAt ?? DateTime.now().toIso8601String(),
    };
  }

  static ContactModel fromDatabase(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      avatar: map['avatar'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }
}
