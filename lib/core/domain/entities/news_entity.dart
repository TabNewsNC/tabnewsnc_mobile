import 'package:dart_mappable/dart_mappable.dart';
import 'package:tabnews/core/domain/hooks.dart';

part 'news_entity.mapper.dart';

@MappableClass(caseStyle: .snakeCase)
class NewsEntity with NewsEntityMappable {
  const NewsEntity({
    required this.id,
    required this.ownerId,
    required this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.ownerUsername,
    required this.tabcoins,
    required this.tabcoinsCredit,
    required this.tabcoinsDebit,
    required this.commentCount,
    required this.children,
    this.title,
    this.body,
  });

  final String id;
  final String ownerId;
  final String slug;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final int tabcoins;
  final int tabcoinsCredit;
  final int tabcoinsDebit;
  final String ownerUsername;

  @MappableField(key: 'children_deep_count')
  final int commentCount;

  @MappableField(hook: NullToListHook())
  final List<NewsEntity> children;

  final String? title;
  final String? body;
}
