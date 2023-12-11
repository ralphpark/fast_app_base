

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_arrow.dart';
import '../../../../../common/widget/w_height_and_width.dart';
import '../../../../../common/widget/w_long_button.dart';
import 'w_interest_stock_list.dart';

class MystockFragment extends StatelessWidget {
  const MystockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getmyAccount(context), height20, getMyStock(context),
      ],
    );
  }

  Widget getmyAccount(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),

    color: context.appColors.roundedLayoutBackground,
    child : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20,
        '계좌'.text.make(),
        Row(children:[
          '443원'.text.size(24).bold.make(),
          Arrow(),
          emptyExpanded,
          RoundedContainer(child: '채우기'.text.size(12).make(),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            radius: 8,
            backgroundColor: context.appColors.buttonBackground,
          ),
      ]),
        height30,
        Line(color: context.appColors.divider,),
        height10,
        const LongButton(title: '주문내역'),
        const LongButton(title: '판매수익'),
    ],)
  );

  Widget getMyStock(BuildContext context) => Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
            color: context.appColors.roundedLayoutBackground,
        child: Column(children: [
          height30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              '관심주식'.text.bold.make(),
              '편집하기'.text.color(context.appColors.lessImportant).make(),
              ],
          ),
          height20,
          Tap(
            onTap: () {
              context.showSnackbar('기본');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['기본'.text.bold.make(), const Arrow(direction: AxisDirection.up,)],
              ),
            ),
          ),

        ],),
      ),
      InterestStockList().pSymmetric(h: 20),
    ],
  );
}

