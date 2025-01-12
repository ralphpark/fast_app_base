import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/stream_test.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_account_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/w_rive_like_button.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttoss_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:live_background/live_background.dart';
import 'package:live_background/widget/live_background_widget.dart';

import '../../../../common/widget/w_big_button.dart';
import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';
import 's_number.dart';
import 'w_bank_account.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  int count = 0;
  @override
  void initState(){
    countStream(5).listen((event) {
      setState(() {
        count = event;
      });
    });
  }
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child:  Stack(
        children: [
          const LiveBackgroundWidget(
            palette: Palette(colors: [Colors.red, Colors.blue, Colors.green]),
            velocityX: 0.5,
            velocityY: 0.5,
            particleCount: 100,
          ),
          RefreshIndicator(
            edgeOffset: TtossAppBar.appBarHeight,
            onRefresh: () async{
              await sleepAsync(NumDurationExtension(500).ms);
            },

            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: TtossAppBar.appBarHeight,
                  bottom: MainScreenState.bottomNavigationBarHeight),
              child : Column(children: [
                SizedBox(
                  height: 250,
                  width: 250,
                    child:
                    RiveLiveButton(isLiked, onTapLike: (isLike) {
                      setState(() {
                        this.isLiked = isLike;
                      });
                    })),
                StreamBuilder(
                  builder : (context,snapshot,){
                  final count = snapshot.data;
                  switch (snapshot.connectionState){
                    case ConnectionState.none:
                      return const CircularProgressIndicator();
                    case ConnectionState.waiting:
                      return 'waiting'.text.make();
                    case ConnectionState.active:
                      return count!.text.size(30).bold.make();
                    case ConnectionState.done:
                      return 'done'.text.make();
                  }
                  },
                  stream: countStream(5),
                ),
                BigButton('토스뱅크',
                    onTap: () async {
                      print('start');
                      final result = await Nav.push(NumberScreen());
                      print(result);
                      print('end');
                  }),
                  height10,
                  RoundedContainer(
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "자산".text.bold.white.make(),
                          height5,
                          ...bankAccounts
                              .map((e) => BankAccountWidget(e)).toList(),
                  ],))
                ],),
              // ).pSymmetric(h: 20).animate().slideY(duration: NumDurationExtensions(4000).ms).fadeIn(),
            ),
          ),
          TtossAppBar(),
        ],
      ),
    );
  }
  Stream<int> countStream(int max) async*{ // async* : Stream을 반환하는 함수
    await sleepAsync(2.seconds);
    for(int i = 0; i < max; i++){
      await sleepAsync(4.seconds);
      yield i; // yield : Stream에 값을 전달하는 키워드
    }
  }
  void showSnackbar(BuildContext context) {
    context.showSnackbar('snackbar 입니다.',
        extraButton: Tap(
          onTap: () {
            context.showErrorSnackbar('error');
          },
          child: '에러 보여주기 버튼'.text.white.size(13).make().centered().pSymmetric(h: 10, v: 5),
        ));
  }

  Future<void> showConfirmDialog(BuildContext context) async {
    final confirmDialogResult = await ConfirmDialog(
      '오늘 기분이 좋나요?',
      buttonText: "네",
      cancelButtonText: "아니오",
    ).show();
    debugPrint(confirmDialogResult?.isSuccess.toString());

    confirmDialogResult?.runIfSuccess((data) {
      ColorBottomSheet(
        '❤️',
        context: context,
        backgroundColor: Colors.yellow.shade200,
      ).show();
    });

    confirmDialogResult?.runIfFailure((data) {
      ColorBottomSheet(
        '❤️힘내여',
        backgroundColor: Colors.yellow.shade300,
        textColor: Colors.redAccent,
      ).show();
    });
  }

  Future<void> showMessageDialog() async {
    final result = await MessageDialog("안녕하세요").show();
    debugPrint(result.toString());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
Future sleepAsync(Duration duration)  {
  return Future.delayed(duration);
}