import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateTimeText extends StatelessWidget {
  final DateTime _dateTime;

  DateTimeText(this._dateTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(DateFormat.yMMMMd("en_US").format(_dateTime)),
    );
  }
}
