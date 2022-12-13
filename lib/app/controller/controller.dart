import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/data/providers/database_provider.dart';
import 'package:getx_todo/app/model/todo.dart';

class Controller extends GetxController {
  RxList<Todo> todos = <Todo>[].obs;
  DatabaseProvider db = DatabaseProvider.instance;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    getAllTodos();
    super.onInit();
  }

  void getAllTodos() {
    todos = db.getAll<Todo>().obs;
  }

  void addTodo() {
    Todo newTodo = Todo()..task = textController.text;
    db.add<Todo>(newTodo);
    todos.add(newTodo);
    textController.clear();
    Get.back();
  }

  void updateTodoTaskAt(int index) {
    Todo todo = todos[index];
    todo.task = textController.text;
    todo.save();
    todos[index] = todo;
    textController.clear();
    Get.back();
  }

  void updateTodoStatusAt(int index) {
    Todo todo = todos[index];
    todo.done = !(todo.done!);
    todo.save();
    todos[index] = todo;
  }

  void deleteTodoAt(int index) async {
    await todos[index].delete();
    todos.removeAt(index);
  }
}
