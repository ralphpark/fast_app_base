import 'dart:ui';

import 'package:fast_app_base/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/utils.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/vo_popular_stock.dart';

class Stock extends PopularStock {
  final String stockImagePath;

  Stock(
      {required this.stockImagePath,
      required super.yesterdayClosePrice,
      required super.currentPrice,
      required super.stockName});

}