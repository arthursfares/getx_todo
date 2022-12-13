import 'package:flutter/material.dart';
import 'package:getx_todo/app/controller/controller.dart';
import 'package:getx_todo/app/model/todo.dart';
import 'package:getx_todo/app/view/bottom_sheet.dart';
import 'package:getx_todo/app/view/todo_tile.dart';

class TodosList extends StatelessWidget {
  const TodosList({
    Key? key,
    required this.controller,
    required this.bottomSheet,
  }) : super(key: key);

  final Controller controller;
  final TodoBottomSheet bottomSheet;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        Todo todo = controller.todos[index];
        return TodoTile(
          controller: controller,
          todo: todo,
          bottomSheet: bottomSheet,
          index: index,
        );
      },
    );
  }
}


