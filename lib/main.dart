import 'package:expence_app/model/Purchase.dart';
import 'package:expence_app/widget/PurchaseList.dart';
import 'package:expence_app/widget/UserInput.dart';
import 'package:expence_app/widget/Chart.dart';
import 'package:flutter/material.dart';

final List<Purchase> _purchases = [
  Purchase(id: 1, title: "Milk", price: 1333.2, dateTime: DateTime.now())
];

List<Purchase> get _purchasesForWeek {
  return _purchases
      .where(
          (p) => p.datetime.isAfter(DateTime.now().subtract(Duration(days: 7))))
      .toList();
}

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyApp(),
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'OpenSans',
          /*textTheme: ThemeData.dark().textTheme.copyWith(
                  headline6: TextStyle(fontSize: 30),
                  headline2: TextStyle(fontSize: 10),
                )));*/
        ));
  }
}

// Main screen
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second App"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Chart(_purchasesForWeek),
          PurchaseList(_purchases, _deletePurchase)
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ));
  }

  _addPurchase(String txTitle, double txPrice, DateTime dateTime) {
    dateTime = DateTime.now();
    setState(() {
      _purchases.add(
          Purchase(id: 1, title: txTitle, price: txPrice, dateTime: dateTime));
    });
    Navigator.pop(context);
  }

  _deletePurchase(int id) {
    setState(() {
      _purchases.removeWhere((p) => p.id == id);
    });

  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: UserInput(_addPurchase),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
}
