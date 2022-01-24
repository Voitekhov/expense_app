import 'package:expence_app/model/Purchase.dart';
import 'package:expence_app/widget/chart/CharBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Purchase> _purchases;

  Chart(this._purchases);

  List<Map<String, double>> get _dataForChart => List.generate(7, (index) {
        Map<String, double> toReturn = Map();
        final date = DateTime.now().subtract(Duration(days: index));
        double totalAmount = 0;
        for (Purchase p in _purchases) {
          if (date.day == p.datetime.day &&
              date.month == p.datetime.month &&
              date.year == p.datetime.year) {
            totalAmount += p.price;
          }
        }
        toReturn[DateFormat('EEEE').format(date)] = totalAmount;
        return toReturn;
      }).reversed.toList();

  double get _totalAmount => _purchases.fold(
      0, (previousValue, element) => element.price + previousValue);

  @override
  Widget build(BuildContext context) {
    print(_dataForChart);
    return Card(
      elevation: 7,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ..._dataForChart.map((p) {
                String dayOfWeek = p.keys.elementAt(0);
                double amount = p[dayOfWeek] ?? 0;
                return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(dayOfWeek.substring(0, 3), amount,
                        _totalAmount == 0 ? 0 : amount / _totalAmount));
              })
            ],
          ),
        ),
      ),
    );
  }
}
