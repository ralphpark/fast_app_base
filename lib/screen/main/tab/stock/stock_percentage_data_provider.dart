
import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

abstract mixin class StockPercentageDataProvider{
  int get yesterdayClosePrice;
  int get currentPrice;

  double get todayPercentage => ((currentPrice - yesterdayClosePrice)/yesterdayClosePrice * 100).toPrecision(2);

  String get todayPercentageString =>
      '$symbol$todayPercentage%';

  bool get isPlus => currentPrice > yesterdayClosePrice;

  bool get isSame => currentPrice == yesterdayClosePrice;

  bool get isMinus => currentPrice < yesterdayClosePrice;

  String get symbol => isPlus ? '+' : isMinus ? '' : '';

  Color getPriceColor(BuildContext context) => isPlus ? context.appColors.plus : isMinus ? context.appColors.minus : context.appColors.lessImportant;

}
