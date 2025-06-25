// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';
//
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'avatar': instance.avatar,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
