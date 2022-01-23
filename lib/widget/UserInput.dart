import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  Function addPurchase;

  UserInput(this.addPurchase);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _addToList(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _addToList(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () => _addToList(),
            ),
          ],
        ),
      ),
    );
  }

  _addToList() {
    if (titleController.text.isEmpty || amountController.text.isEmpty) {
      return;
    }
    double amount = double.parse(amountController.text);
    if (amount < 0) {
      return;
    }
    widget.addPurchase(titleController.text, amount, DateTime.now());
  }
}
