
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../common/data/preference/prefs.dart';
import 'd_number.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  late AnimationController animationController = AnimationController(vsync: this, duration: 0.2.seconds);
  bool isPushOn = false;

  @override
  void initState() {
    isPushOn = Prefs.isPushOn.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller : scrollController,
            padding: EdgeInsets.only(top: 150),
            children: [
            SwitchMenu('푸시 설정', isPushOn, onChanged: (isOn) {
              Prefs.isPushOn.set(isOn);
              setState(() {
                isPushOn = isOn;
              });
            }),
            Obx(() =>
                Slider(
                    value: Prefs.sliderPosition.get(),
                    onChanged: (value) {
                      animationController.animateTo(value, duration: 0.seconds);
                      Prefs.sliderPosition.set(value);
                    })),
            Obx(
                ()=>BigButton('날짜 ${Prefs.birthday.get() == null?'':Prefs.birthday.get()?.formattedDate}', onTap: () async {
                final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(90.days),
                    lastDate: DateTime.now().add(90.days));
                if (date != null) {
                  Prefs.birthday.set(date);
                }},
                ),
            ),
            Obx(
                  ()=>BigButton('저장된 숫자 ${Prefs.number.get()}',
                    onTap: () async {
                      final number = await NumberDialog().show();
                      if (number != null) {
                        Prefs.number.set(number);
                      }},
              ),
            ),
            BigButton('오픈소스 화면', onTap: () async{
              Nav.push(OpensourceScreen());
              },
            ),
              BigButton('애니메이션 forward', onTap: () async{
                animationController.forward();
              },
              ),
              BigButton('애니메이션 reverse', onTap: () async{
                animationController.reverse();
              },
              ),
              BigButton('애니메이션 repeat', onTap: () async{
                animationController.repeat();
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
              BigButton('오픈소스 화면', onTap: () async{
                Nav.push(OpensourceScreen());
              },
              ),
            ],
          ),
          AnimatedAppBar(
            '설정',
             scrollcontroller: scrollController, animationController: animationController,
          ),
        ],
      ),
    );
  }
}