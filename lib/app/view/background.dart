import 'package:flutter/material.dart';
import 'package:getx_todo/app/view/background_image.dart';
import 'package:getx_todo/app/view/todos_container.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        TodosContainer(child: child),
      ],
    );
  }
}




