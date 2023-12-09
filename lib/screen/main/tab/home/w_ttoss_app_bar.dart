import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TtossAppBar extends StatefulWidget {
  static const appBarHeight = 60.0;
  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {

  bool _showRedDot = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: TtossAppBar.appBarHeight,
      color: context.appColors.appBarBackground,
      child: Row(
        children: [
          width10,
          Image.asset("assets/image/icon/toss.png", height: 30),
          emptyExpanded,
          Image.asset("assets/image/icon/map_point.png", height: 30),
          width10,

          Tap(
            onTap: () {
              Nav.push(NotificationScreen());
            },
            child: Stack(
              children: [
                Image.asset("assets/image/icon/notification.png", height: 30),
                if(_showRedDot)Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ).animate(onComplete: (controller) => controller.repeat() ).shake(duration: NumDurationExtension(2000).ms, hz: 3).then().fadeOut(duration: NumDurationExtension(3000).ms),
          ),
          width10,
      ],),
    );
  }
}
