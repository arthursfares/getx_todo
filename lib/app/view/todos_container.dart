import 'package:flutter/material.dart';
import 'package:getx_todo/app/core/values/colors.dart';

class TodosContainer extends StatelessWidget {
  const TodosContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 4),
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              color: black,
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 8.0,
                right: 8.0,
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
