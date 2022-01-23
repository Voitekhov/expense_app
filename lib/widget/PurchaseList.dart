import 'package:expence_app/model/Purchase.dart';
import 'package:expence_app/widget/PurchaseCard.dart';
import 'package:flutter/material.dart';

class PurchaseList extends StatefulWidget {
  List<Purchase> _purchases;
  Function _delete;

  PurchaseList(this._purchases, this._delete);

  @override
  _PurchaseListState createState() {
    return _PurchaseListState();
  }
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget._purchases.isEmpty
            ? [
                Column(
                  children: [
                    Text("No purchases yet"),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 300,
                        child: Image(
                          image: AssetImage('assets/image/waiting.png'),
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              ]
            : [
                Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: widget._purchases.length,
                      itemBuilder: (ctx, index) {
                        return PurchaseCard(
                            widget._purchases[index], widget._delete);
                      },
                    )),
              ]);
  }
}
