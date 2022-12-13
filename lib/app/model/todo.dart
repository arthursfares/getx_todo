import 'package:hive_flutter/adapters.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  String? task;

  @HiveField(1)
  bool? done = false;
}
