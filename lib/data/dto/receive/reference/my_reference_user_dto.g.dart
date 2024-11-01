// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_reference_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyReferenceUserDto _$MyReferenceUserDtoFromJson(Map<String, dynamic> json) =>
    MyReferenceUserDto(
      userName: json['userName'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : MediaDto.fromJson(json['profilePicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyReferenceUserDtoToJson(MyReferenceUserDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'profilePicture': instance.profilePicture,
    };
