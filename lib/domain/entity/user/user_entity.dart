import 'package:flutter/material.dart';

@immutable
final class UserEntity {
  final int id;
  final String name;
  final String surname;
  final String email;
  final String walletAddress;
  final String referanceCode;
  final String profileImage;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.referanceCode,
    required this.surname,
    required this.walletAddress,
  });
}
