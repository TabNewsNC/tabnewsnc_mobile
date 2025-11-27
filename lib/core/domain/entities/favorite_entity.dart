import 'package:dart_mappable/dart_mappable.dart';

part 'favorite_entity.mapper.dart';

@MappableClass(caseStyle: .snakeCase)
class FavoriteEntity with FavoriteEntityMappable {
  const FavoriteEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.publishedAt,
    required this.ownerUsername,
  });

  final String id;
  final String slug;
  final String title;
  final DateTime publishedAt;
  final String ownerUsername;
}
