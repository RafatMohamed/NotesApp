import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class AddNoteModel{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final DateTime  createdAt;
  @HiveField(3)
  final int color;
  AddNoteModel( {
    required this.title,
    required this.desc,
    required this.createdAt,
    required this.color,
  });

}