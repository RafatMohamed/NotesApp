import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  int color;
  NoteModel({
    required this.title,
    required this.desc,
    required this.createdAt,
    required this.color,
  });
}
