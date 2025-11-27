import 'package:dart_mappable/dart_mappable.dart';

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum NewsFilterEnum {
  old('old'),
  recent('new'),
  relevant('relevant')
  ;

  const NewsFilterEnum(this.value);
  final String value;
}
