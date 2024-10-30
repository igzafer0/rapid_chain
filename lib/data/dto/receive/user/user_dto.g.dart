// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      profileImage: json['profileImage'] == null
          ? null
          : MediaDto.fromJson(json['profileImage'] as Map<String, dynamic>),
      referenceCode: json['referenceCode'] as String?,
      surname: json['surname'] as String?,
      walletAddress: json['walletaddress'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'walletaddress': instance.walletAddress,
      'referenceCode': instance.referenceCode,
      'profileImage': instance.profileImage,
    };
