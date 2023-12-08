import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_image_button.dart';
import 'setting/s_setting_screen.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;
  get title => Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children:[
        '토스증권'.text.bold.size(24).make(),
        width20,
        'S&P500'.text.size(13).color(context.appColors.lessImportant).make(),
        width20,
        3919.29.toComma().text.bold.size(13).color(context.appColors.plus).make(),
      ]
    ).pOnly(left:20),
  );
  get tabBar => Column(
    children:[
      TabBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        labelPadding: const EdgeInsets.symmetric(vertical: 20),
        automaticIndicatorColorAdjustment: false,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: -20),
        indicatorColor: Colors.white,
        controller: tabController,
        tabs: [
        '내주식'.text.make(),
        '오늘의 발견'.text.make(),
      ],),
      const Line(),
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
            backgroundColor: context.appColors.roundedLayoutBackground,
            pinned: true,
            actions: [
              ImageButton(
                onTap: () {
                  Nav.push(const SearchStockScreen());
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
                  Nav.push(SettingsScreen());
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
                  if(currentIndex == 0)
                    MystockFragment()
                  else
                    TodaysDiscoveryFragment(),
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


