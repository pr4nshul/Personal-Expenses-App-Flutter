import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleHandler = TextEditingController();

  final amountHandler = TextEditingController();

  void submitData(){
    final enteredText = titleHandler.text;
    final enteredAmount = double.parse(amountHandler.text);
    if(enteredAmount<=0 || enteredText.isEmpty){
      return;
    }
    widget.addTx(enteredText, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleHandler,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountHandler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
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
              onPressed:submitData,
            )
          ],
        ),
      ),
    );
  }
}
