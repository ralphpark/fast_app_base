import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog({super.key,super.animation = NavAni.Fade,super.barrierDismissible = false});

  @override
  State<NumberDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NumberDialog> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          RoundedContainer(child: Column(
            children:[
              '숫자를 입력하세요'.text.size(16).make(),
              TextField(controller:controller, keyboardType: TextInputType.number),
              RoundButton(text: '완료', onTap: () {
                final number = int.tryParse(controller.text);
                widget.hide(number);
                if(number != null) {
                  Navigator.pop(context,number);
                  }
                },
              )
            ]),
          ),
        ],
      ),
    );
  }
}
