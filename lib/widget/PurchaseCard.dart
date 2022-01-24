import 'package:expence_app/model/Purchase.dart';
import 'package:expence_app/widget/purchase_card_inner_widgets/DateTimeText.dart';
import 'package:expence_app/widget/purchase_card_inner_widgets/PriceText.dart';
import 'package:expence_app/widget/purchase_card_inner_widgets/TitleText.dart';
import 'package:flutter/material.dart';

class PurchaseCard extends StatefulWidget {
  final Purchase _purchase;
  final Function _delete;

  PurchaseCard(this._purchase, this._delete);

  @override
  State<PurchaseCard> createState() => _PurchaseCardState();
}

class _PurchaseCardState extends State<PurchaseCard> {
  @override
  Widget build(BuildContext context) {
    return /*Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                  child: Text(
            widget._purchase.price.toString(),
            style: TextStyle(fontSize: 20),
          ))),
          radius: 30,
        ),
        title: Text(widget._purchase.title),
        subtitle:
            Text(DateFormat.yMMMMd("en_US").format(widget._purchase.datetime)),
      ),
    );
*/
        Card(
            child: Row(children: [
      PriceText(widget._purchase.price),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(widget._purchase.title),
          DateTimeText(widget._purchase.datetime),
        ],
      ),
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          child: IconButton(
              onPressed: () => widget._delete(widget._purchase.id),
              icon: Image(
                image: AssetImage('assets/image/deleteIcon.jpeg'),
                fit: BoxFit.fill,
              )),
        ),
      )
    ]));
  }
}
