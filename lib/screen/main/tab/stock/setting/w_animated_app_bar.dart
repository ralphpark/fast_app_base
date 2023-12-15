
import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../../../common/widget/w_arrow.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollcontroller;
  final AnimationController animationController;
  const AnimatedAppBar(this.title,{super.key, required this.scrollcontroller, required this.animationController});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar>  {
  Duration get duration => 0.01.seconds;
  double scrollPosition = 0;
  // late Animation animation = ColorTween(begin:Colors.cyan, end:Colors.red, ).animate(controller);
  late CurvedAnimation animation = CurvedAnimation(parent: widget.animationController, curve: Curves.bounceInOut);


  @override
  void initState() {
    widget.scrollcontroller.addListener(() {
      setState(() {
      });
    });

    widget.scrollcontroller.addListener(() {
      setState(() {
        scrollPosition = widget.scrollcontroller.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80;

  double getValue(double initial, double target) {
    if(isTriggered) {
      return target;
    }
    double fraction = scrollPosition/80;
    return initial + (target - initial) * fraction;
    }

  @override
  Widget build(BuildContext context) {


    return Container(
      width: double.infinity,

      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(children: [
          AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(left: getValue(20, 50), top: getValue(50, 15)),
              child : AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(
                  fontSize: getValue(30, 18), fontWeight: FontWeight.bold,),
                child: widget.title.text.make(),
              )
          ),
          Tap(
            onTap:(){
              Nav.pop(context);
            },
            child: Arrow(direction:AxisDirection.left),
          ).p20(),
          Positioned(
            left: animation.value *200,
            child: TweenAnimationBuilder<Color?>(
              duration: 1000.ms,
              tween: ColorTween(begin: Colors.green, end: isTriggered? Colors.orange: Colors.green),
              builder: (context, value, child) =>
                  Image.asset(
                    "assets/image/icon/map_point.png",
                    height: 60,
                    color: value,
                    colorBlendMode: BlendMode.modulate,
                  )

            ),
          ),
        ],),
      ),
    );
  }
}
