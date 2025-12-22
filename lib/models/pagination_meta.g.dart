// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    PaginationMeta(
      current: (json['current'] as num).toInt(),
      next: json['next'] as String?,
      totalItems: (json['total_items'] as num).toInt(),
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$PaginationMetaToJson(PaginationMeta instance) =>
    <String, dynamic>{
      'current': instance.current,
      'next': ?instance.next,
      'total_items': instance.totalItems,
      'has_more': instance.hasMore,
    };
