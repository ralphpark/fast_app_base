import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../../../common/widget/w_tap.dart';


class TextWatchingBear extends StatefulWidget {
  final bool check;
  final bool handsUp;
  final double look;

  const TextWatchingBear( {super.key, required this.check, required this.handsUp, required this.look, });

  @override
  State<TextWatchingBear> createState() => _TextWatchingBearState();
}

class _TextWatchingBearState extends State<TextWatchingBear> {
  late StateMachineController controller;
  late SMIBool smiCheck;
  late SMIBool smiHandsUp;
  late SMINumber smiLook;


  @override
  void didUpdateWidget(covariant TextWatchingBear oldWidget) {
    if(oldWidget.check != widget.check) {
        smiCheck.value = widget.check;
      }
    if(oldWidget.handsUp != widget.handsUp) {
      smiHandsUp.value = widget.handsUp;
    }
    if(oldWidget.look != widget.look) {
      smiLook.value = widget.look;
    }
    super.didUpdateWidget(oldWidget);
    }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
          'assets/rive/login_screen_bear.riv',
          stateMachines: ["State Machine 1"],
          onInit: (Artboard art) {
            final controller =
            StateMachineController.fromArtboard(
                art, 'State Machine 1')!;
            controller.isActive = true;
            art.addController(controller);
            smiCheck = controller.findInput<bool>('Check') as SMIBool;
            smiHandsUp = controller.findInput<bool>('hands_up') as SMIBool;
            smiLook = controller.findInput<double>('Look') as SMINumber;
          },
    );
  }
}