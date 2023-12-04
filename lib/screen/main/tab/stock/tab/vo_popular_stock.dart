import '../stock_percentage_data_provider.dart';
import 'vo_simple_stock.dart';

class PopularStock extends SimpleStock with StockPercentageDataProvider{

  @override
  final int yesterdayClosePrice;
  @override
  final int currentPrice;

  PopularStock(
      {required this.yesterdayClosePrice,
      required this.currentPrice,
      required String stockName}) : super(stockName);
}