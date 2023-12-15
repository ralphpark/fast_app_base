import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/text_watching_bear.dart';
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

    final numberController = TextEditingController();
    final passwordController = TextEditingController();
    final numberFocus = FocusNode();
    final passwordFocus = FocusNode();

    bool check = false;
    bool handsUp = false;
    double look = 0.0;

    @override
    void initState() {
      numberController.addListener(() {
        setState(() {
          look = numberController.text.length.toDouble()*1.5;
        });
      });
      numberFocus.addListener(() {
        setState(() {
          check = numberFocus.hasFocus;
        });
      });
      passwordFocus.addListener(() {
        setState(() {
          handsUp = passwordFocus.hasFocus;
        });
      });
    super.initState();
    // Add code after super
    }


    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          RoundedContainer(child: Column(
            children:[
              '숫자를 입력하세요'.text.size(16).make(),
              SizedBox(
                height: 230,
                width: 230,
                child: TextWatchingBear(
                  check: check,
                  handsUp: handsUp,
                  look: look,
                ),
              ),
              TextField(
                focusNode: numberFocus,
                controller: numberController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                focusNode: passwordFocus,
                obscureText: true,
                controller: numberController,
                keyboardType: TextInputType.number,
              ),
              RoundButton(text: '완료', onTap: () {
                final number = int.tryParse(numberController.text);
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
