import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 's_stock_detail_screen.dart';
import 'search_stock_data.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchStockProvider{
  final TextEditingController controller;
  SearchAutoCompleteList(this.controller,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchData.autoCompleteList.length, // itemCount를 추가
      itemBuilder: (context, index) {
        final stock = searchData.autoCompleteList[index];
        final stockName = stock.name;
        return Tap(
          onTap:() {
            controller.clear();
            searchData.addHistory(stock );
            Nav.push(StockDetailScreen(stockName));
          },
          child:
          stockName.text.make().p20(),
        );
      },
    );
  }
}




// {
// // index가 리스트의 범위 내에 있는지 검증
// if (index < searchData.autoCompleteList.length) {
// return searchData.autoCompleteList[index].stockName.text.make();
// } else {
// return Container(); // index가 범위를 벗어나면 빈 컨테이너 반환
// }