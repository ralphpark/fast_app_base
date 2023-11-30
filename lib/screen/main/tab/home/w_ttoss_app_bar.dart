import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

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
          Stack(
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
          ),
          width10,
      ],),
    );
  }
}
