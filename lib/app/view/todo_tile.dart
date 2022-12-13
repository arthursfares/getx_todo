import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getx_todo/app/controller/controller.dart';
import 'package:getx_todo/app/core/values/colors.dart';
import 'package:getx_todo/app/model/todo.dart';
import 'package:getx_todo/app/view/bottom_sheet.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    Key? key,
    required this.controller,
    required this.todo,
    required this.bottomSheet,
    required this.index,
  }) : super(key: key);

  final Controller controller;
  final Todo todo;
  final TodoBottomSheet bottomSheet;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            foregroundColor: orange,
            backgroundColor: grey,
            onPressed: (context) => controller.deleteTodoAt(index),
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          todo.task!,
          style: TextStyle(
            fontSize: 23,
            color: todo.done! ? Colors.white70 : Colors.white,
            decoration:
                todo.done! ? TextDecoration.lineThrough : TextDecoration.none,
            overflow: TextOverflow.visible,
          ),
        ),
        onLongPress: () {
          controller.textController.text = todo.task!;
          bottomSheet.showModalBottomSheetHelper(
            buttonAction: () => controller.updateTodoTaskAt(index),
          );
        },
        onTap: () => controller.updateTodoStatusAt(index),
      ),
    );
  }
}