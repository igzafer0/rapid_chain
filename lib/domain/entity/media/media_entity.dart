// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';

@immutable
final class MediaEntity {
  final int id;
  final String url;
  final MEDIA_TYPE mediaType;
  final String oldFileName;
  final MediaMetaDataEntity mediaMetaData;

  const MediaEntity(
      {required this.id,
      required this.url,
      required this.mediaType,
      required this.oldFileName,
      required this.mediaMetaData});
}

@immutable
final class MediaMetaDataEntity {
  final String thumbnail;

  const MediaMetaDataEntity({
    required this.thumbnail,
  });
}
