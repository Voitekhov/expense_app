
import 'package:expence_app/model/Purchase.dart';
import 'package:expence_app/widget/purchase_card_inner_widgets/DateTimeText.dart';
import 'package:expence_app/widget/purchase_card_inner_widgets/PriceText.dart';
import 'package:expence_app/widget/purchase_card_inner_widgets/TitleText.dart';
import 'package:flutter/material.dart';



class PurchaseCard extends StatefulWidget {
  final Purchase _purchase;

  PurchaseCard(this._purchase);

  @override
  State<PurchaseCard> createState() => _PurchaseCardState();
}

class _PurchaseCardState extends State<PurchaseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      PriceText(widget._purchase.price),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(widget._purchase.title),
          DateTimeText(widget._purchase.datetime),
        ],
      )
    ]));
  }
}
