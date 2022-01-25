import 'dart:io';

import 'package:expence_app/model/Purchase.dart';
import 'package:expence_app/widget/PurchaseList.dart';
import 'package:expence_app/widget/UserInput.dart';
import 'package:expence_app/widget/chart/Chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int sq_id = 1;

final List<Purchase> _purchases = [
  Purchase(id: sq_id, title: "Milk", price: 1333.2, dateTime: DateTime.now()),
  Purchase(id: ++sq_id, title: "Bread", price: 2.3, dateTime: DateTime.now())
];

bool isChartVisible = false;

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
    ObstructingPreferredSizeWidget cupertinoAppBar = CupertinoNavigationBar(
      middle: Text('Personal Expenses'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Icon(CupertinoIcons.add),
            onTap: () => _startAddNewTransaction(context),
          )
        ],
      ),
    );

    PreferredSizeWidget androidAppBar = AppBar(
      title: Text("Second App"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );

    final double workingScreenHeight = MediaQuery.of(context).size.height -
        (Platform.isAndroid
            ? androidAppBar.preferredSize.height
            : cupertinoAppBar.preferredSize.height) -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    double percentageOfHeightForChart = isLandscape ? 0.8 : 0.2;
    double percentageOfHeightForPurchaseList = isLandscape ? 0.85 : 0.8;

    Widget chart = Container(
        height: workingScreenHeight * percentageOfHeightForChart,
        child: Chart(_purchasesForWeek));

    Widget purchaseList = Container(
        height: workingScreenHeight * percentageOfHeightForPurchaseList,
        child: PurchaseList(_purchases, _deletePurchase));

    Widget scaffold = Scaffold(
        appBar: androidAppBar,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: isLandscape
                ? [
                    Container(
                      height: workingScreenHeight * 0.1,
                      child: Switch.adaptive(
                        value: isChartVisible,
                        onChanged: (bool value) {
                          setState(() {
                            isChartVisible = value;
                          });
                        },
                      ),
                    ),
                    isChartVisible ? chart : purchaseList
                  ]
                : [chart, purchaseList]),
        floatingActionButton: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ));

    Widget cupertionScaffold = CupertinoPageScaffold(
      navigationBar: cupertinoAppBar,
      child: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: isLandscape
                ? [
                    Container(
                      height: workingScreenHeight * 0.1,
                      child: Switch.adaptive(
                        value: isChartVisible,
                        onChanged: (bool value) {
                          setState(() {
                            isChartVisible = value;
                          });
                        },
                      ),
                    ),
                    isChartVisible ? chart : purchaseList
                  ]
                : [chart, purchaseList]),
      ),
    );

    return Platform.isIOS ? cupertionScaffold : scaffold;
  }

  _addPurchase(String txTitle, double txPrice, DateTime dateTime) {
    setState(() {
      _purchases.add(Purchase(
          id: ++sq_id, title: txTitle, price: txPrice, dateTime: dateTime));
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
