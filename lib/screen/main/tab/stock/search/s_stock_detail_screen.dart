
import 'package:flutter/material.dart';

class StockDetailScreen extends StatelessWidget {
  final String stockName;
  const StockDetailScreen(this.stockName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('주식 상세 페이지'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('돌아가기'),
            ),
          ],
        ),
      )
    );
  }
}
