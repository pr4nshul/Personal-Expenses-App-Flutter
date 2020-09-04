import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleHandler = TextEditingController();
  final amountHandler = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleHandler,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountHandler,
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              color: Colors.black,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                addTx(titleHandler.text, double.parse(amountHandler.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
