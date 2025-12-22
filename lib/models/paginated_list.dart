import 'package:kreyno/models/pagination_meta.dart';

class PaginatedList<T> {
  final List<T> items;
  final PaginationMeta meta;

  const PaginatedList({required this.items, required this.meta});
}
