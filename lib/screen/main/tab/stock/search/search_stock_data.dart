
import 'package:fast_app_base/common/util/local_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tab/vo_simple_stock.dart';

abstract mixin class SearchStockProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController{
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(  ['KB금융', '신한지주', 'LG화학', 'NAVER']);
    loadLocalStockJson();
    super.onInit();
  }
  Future<void> loadLocalStockJson() async {
    final jsonList = await LocalJson.getObjectList<SimpleStock>("json/stock_list.json");
    stocks.addAll(jsonList);
  }

  void search(String keyword) {
    if(keyword.isEmpty){
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value =
        stocks.where((element) => element.name.contains(keyword)).toList();
  }

  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  void removeHistory(String stockName) {
    searchHistoryList.remove(stockName);
  }
}

