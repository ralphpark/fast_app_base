import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../../common/common.dart';

class RiveLiveButton extends StatefulWidget {
  final bool isLike;
  final void Function(bool isLike) onTapLike;
  const RiveLiveButton(this.isLike, {super.key, required this.onTapLike});

  @override
  State<RiveLiveButton> createState() => _RiveLiveButtonState();
}

class _RiveLiveButtonState extends State<RiveLiveButton> {
  late StateMachineController controller;
  late SMIBool smiPressed;
  late SMIBool smiHover;



  @override
  void initState() {
    widget.isLike;
    super.initState();
  }
  @override
  void didUpdateWidget(covariant RiveLiveButton oldWidget) {
    if(oldWidget.isLike != widget.isLike) {
      if(widget.isLike){
        smiPressed.value = true;
        smiHover.value = true;
      } else {
        smiPressed.value = false;
        smiHover.value = false;
      }
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        widget.onTapLike(!widget.isLike);
        },
      child: RiveAnimation.asset(
          'assets/rive/light_like2.riv',
          stateMachines: ["State Machine 1"],
          onInit: (Artboard art) {
            final controller =
            StateMachineController.fromArtboard(
                art, 'State Machine 1')!;
            controller.isActive = true;
            art.addController(controller);
            smiPressed = controller.findInput<bool>('Pressed') as SMIBool;
            smiHover = controller.findInput<bool>('Hover') as SMIBool;
      }),
    );
  }
}