import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:getx_todo/app/controller/controller.dart';
import 'package:getx_todo/app/core/values/colors.dart';
import 'package:getx_todo/app/view/bottom_sheet_button.dart';
import 'package:getx_todo/app/view/todo_form_field.dart';

class TodoBottomSheet {
  final BuildContext context;
  final Controller controller;

  TodoBottomSheet({required this.context, required this.controller});

  void _closeBottomSheet() {
    controller.textController.clear();
  }

  void showModalBottomSheetHelper({void Function()? buttonAction}) {
    Future<void> bottomSheet = showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomSheetContent(
                controller: controller,
                buttonAction: buttonAction,
              ),
            ],
          ),
        );
      },
    );
    bottomSheet.then((value) => _closeBottomSheet());
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    Key? key,
    required this.controller,
    this.buttonAction,
  }) : super(key: key);

  final Controller controller;
  final void Function()? buttonAction;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Neumorphic(
        style: const NeumorphicStyle(
          color: grey,
          disableDepth: true,
        ),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    child: TodoFormField(controller: controller),
                  ),
                  BottomSheetButton(
                    buttonAction: controller.textController.text.isEmpty
                        ? null
                        : buttonAction,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
