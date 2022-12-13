import 'package:flutter/material.dart';
import 'package:getx_todo/app/controller/controller.dart';

class TodoFormField extends StatelessWidget {
  const TodoFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.textController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      style: const TextStyle(fontSize: 18),
      maxLines: 1,
    );
  }
}
