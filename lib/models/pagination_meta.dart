import 'package:json_annotation/json_annotation.dart';

part 'pagination_meta.g.dart';

@JsonSerializable()
class PaginationMeta {
  final int current;
  final String? next;
  @JsonKey(name: 'total_items')
  final int totalItems;
  @JsonKey(name: 'has_more')
  final bool hasMore;

  const PaginationMeta({
    required this.current,
    this.next,
    required this.totalItems,
    required this.hasMore,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationMetaToJson(this);
}
