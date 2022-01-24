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
    return widget._purchases.isEmpty
        ? LayoutBuilder(builder: ((ctx, cons) {
            return Container(
                child: Column(
              children: [
                Container(
                    height: cons.maxHeight * 0.07,
                    child: Text("No purchases yet")),
                SizedBox(
                  height: cons.maxHeight * 0.03,
                ),
                Container(
                    height: cons.maxHeight * 0.9,
                    child: Image(
                      image: AssetImage('assets/image/waiting.png'),
                      fit: BoxFit.cover,
                    )),
              ],
            ));
          }))
        : ListView.builder(
            itemCount: widget._purchases.length,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return PurchaseCard(widget._purchases[index], widget._delete);
            },
          );
  }
}
