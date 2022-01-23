import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String _title;

  TitleText(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _title,
        style: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 20, /*fontWeight: FontWeight.bold*/
        ),
      ),
    );
  }
}
