import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/view/add_todo_fab.dart';
import 'package:getx_todo/app/view/background.dart';
import 'package:getx_todo/app/controller/controller.dart';
import 'package:getx_todo/app/view/bottom_sheet.dart';
import 'package:getx_todo/app/view/empty_todos_placeholder.dart';
import 'package:getx_todo/app/view/todos_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    final TodoBottomSheet bottomSheet = TodoBottomSheet(
      context: context,
      controller: controller,
    );

    return Scaffold(
      body: Obx(
        () => Background(
          child: controller.todos.isEmpty
              ? const EmptyTodosPlaceholder()
              : TodosList(
                  controller: controller,
                  bottomSheet: bottomSheet,
                ),
        ),
      ),
      floatingActionButton: AddTodoFAB(
        bottomSheet: bottomSheet,
        controller: controller,
      ),
    );
  }
}
