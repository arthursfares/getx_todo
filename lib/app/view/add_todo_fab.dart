import 'package:flutter/material.dart';
import 'package:getx_todo/app/controller/controller.dart';
import 'package:getx_todo/app/core/values/colors.dart';
import 'package:getx_todo/app/view/bottom_sheet.dart';

class AddTodoFAB extends StatelessWidget {
  const AddTodoFAB({
    Key? key,
    required this.bottomSheet,
    required this.controller,
  }) : super(key: key);

  final TodoBottomSheet bottomSheet;
  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: orange,
      onPressed: () => bottomSheet.showModalBottomSheetHelper(
          buttonAction: controller.addTodo),
      child: const Icon(Icons.add),
    );
  }
}
