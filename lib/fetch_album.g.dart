// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title'],
  );
  return Album(
    json['id'] as int,
    json['title'] as String? ?? 'default title',
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
