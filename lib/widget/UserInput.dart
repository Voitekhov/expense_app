import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptive/AdaptiveElevatedButton.dart';

class UserInput extends StatefulWidget {
  Function addPurchase;

  UserInput(this.addPurchase);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime? _selectedDate = null;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              10, 10, 10, MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _addToList(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _addToList(),
                // onChanged: (val) => amountInput = val,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                alignment: Alignment.topLeft,
                child: Text(_selectedDate == null
                    ? "Date no chosen"
                    : DateFormat().add_yMd().format(_selectedDate!)),
              ),
              TextButton(
                  onPressed: _showDatePicker, child: Text("Choose date")),
              // place for date time picker
              AdaptiveElevatedButton.of("add to list", _addToList),
            ],
          ),
        ),
      ),
    );
  }

  _addToList() {
    if (_titleController.text.isEmpty || _amountController.text.isEmpty) {
      return;
    }
    double amount = double.parse(_amountController.text);
    if (amount < 0) {
      return;
    }
    widget.addPurchase(_titleController.text, amount,
        _selectedDate == null ? DateTime.now() : _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now().add(Duration(days: 30)),
      context: context,
    ).then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }
}
