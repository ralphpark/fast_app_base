import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_image_button.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  get title => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children:[
      '토스증권'.text.bold.size(24).make(),
      width20,
      'S&P500'.text.size(13).color(context.appColors.lessImportant).make(),
      width20,
      3919.29.toComma().text.bold.size(13).color(context.appColors.plus).make(),
    ]
  ).pOnly(left:20);
  get tabBar => Column(
    children:[
      TabBar(
        controller: tabController,
        tabs: [
        '내주식'.text.make(),
        '오늘의 발견'.text.make(),
      ],),
      Line(),
    ]
  );
  get myAccount => Placeholder();
  get myStock => Placeholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appBarBackground,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              ImageButton(
                onTap: () {
                  context.showSnackbar("검색");
                },
                imagePath: 'assets/image/icon/stock_search.png',
              ),
              ImageButton(
                onTap: () {
                  context.showSnackbar("캘린더");
                },
                imagePath: 'assets/image/icon/stock_calendar.png',
              ),
              ImageButton(
                onTap: () {
                  context.showSnackbar("설정");
                },
                imagePath: 'assets/image/icon/stock_settings.png',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children:[
                  title,
                  tabBar,
                  myAccount,
                  height20,
                  myStock,
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}


