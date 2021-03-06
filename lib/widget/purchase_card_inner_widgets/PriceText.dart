import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final double _price;

  PriceText(this._price);

  static const double _fontSize = 23;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: 77,
      height: 77,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepPurple,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: FittedBox(
        child: Text(
          _price.toStringAsFixed(1),
          textAlign: TextAlign.center,
          style: TextStyle(
            // user can customize textScaleFactor in his phone
            fontSize: _fontSize * MediaQuery.of(context).textScaleFactor,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
