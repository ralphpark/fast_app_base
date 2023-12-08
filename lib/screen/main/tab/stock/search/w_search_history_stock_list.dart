import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'search_stock_data.dart';
class SearchHistoryStockList extends StatefulWidget {
  const SearchHistoryStockList({super.key});

  @override
  State<SearchHistoryStockList> createState() => _SearchHistoryStockListState();
}

class _SearchHistoryStockListState extends State<SearchHistoryStockList> with SearchStockProvider{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          scrollDirection: Axis.horizontal,
          itemCount: searchData.searchHistoryList.length,
          itemBuilder: (context, index) {
            final stockName = searchData.searchHistoryList[index];
            return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    Tap(
                        onTap: () {
                        Nav.push(StockDetailScreen(stockName));
                          },
                        child: searchData.searchHistoryList[index].text.make()),
                    Tap(
                        onTap: () {
                          searchData.removeHistory(stockName);
                          setState(() {});
                        },
                        child: Icon(Icons.close)),
                  ],
                ).box.withRounded(value: 6).color(context.appColors.roundedLayoutBackground).p8.make(),
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}
