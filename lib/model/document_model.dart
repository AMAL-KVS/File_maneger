import 'package:hive_flutter/adapters.dart';
part 'document_model.g.dart';

@HiveType(typeId: 0)
class Document extends HiveObject {
  @HiveField(0)
  late final String name;

  @HiveField(1)
  final String path;

  Document({required this.name, required this.path
      //  String? imagePath,
      });
}
