import 'package:flutter/material.dart';

@immutable
final class TaskEntity {
  final int id;
  final String title;
  final int point;
  final String url;
  final bool collected;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.point,
    required this.url,
    required this.collected,
  });
}
