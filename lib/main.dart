import 'package:daily_expense_tracker/widget/user_transaction.dart';

import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daily expense tracker',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Text('Chart'),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
