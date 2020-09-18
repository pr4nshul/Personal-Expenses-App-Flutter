import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleHandler = TextEditingController();
  DateTime _selectedDate;
  final amountHandler = TextEditingController();

  void submitData() {
    if (titleHandler.text.isEmpty) {
      return;
    }
    final enteredText = titleHandler.text;
    final enteredAmount = double.parse(amountHandler.text);
    if (enteredAmount <= 0 || enteredText.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredText, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Colors.black,
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              right: 10.0,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom
          ),
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
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _selectedDate == null
                              ? 'No date chosen'
                              : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      highlightColor: Colors.white,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      onPressed: _datePicker,
                    )
                  ],
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
                  onPressed: submitData,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
