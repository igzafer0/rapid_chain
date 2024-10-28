import 'package:flutter/material.dart';
import 'package:rapid_chain/domain/entity/media/media_entity.dart';

@immutable
final class TaskEntity {
  final int id;
  final String title;
  final int point;
  final String url;
  final bool collected;
  final MediaEntity cover;

  const TaskEntity(
      {required this.id,
      required this.title,
      required this.point,
      required this.url,
      required this.collected,
      required this.cover});
}
