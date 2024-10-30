import 'package:flutter/material.dart';
import 'package:rapid_chain/domain/entity/media/media_entity.dart';

@immutable
final class UserEntity {
  final int id;
  final String name;
  final String surname;
  final String email;
  final String walletAddress;
  final String referenceCode;
  final MediaEntity profileImage;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.referenceCode,
    required this.surname,
    required this.walletAddress,
  });
}
