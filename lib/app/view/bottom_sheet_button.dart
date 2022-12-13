import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:getx_todo/app/core/values/colors.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    Key? key,
    required this.buttonAction,
  }) : super(key: key);

  final void Function()? buttonAction;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: const NeumorphicStyle(
        color: grey,
        shadowLightColor: shadowLight,
        shadowDarkColor: shadowDark,
      ),
      onPressed: buttonAction,
      child: const Text(
        'done',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
