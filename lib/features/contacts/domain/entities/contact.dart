import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    int? id,
    required String name,
    required String phone,
    String? email,
    String? avatar,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Contact;
}
