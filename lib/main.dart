import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import 'package:flutter/material.dart';
import './modules/transaction.dart';

void main() => runApp(FirstApp());

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily expenses',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor:Colors.amberAccent,
          fontFamily: 'Grandstander',
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userExpenses = [
    Transaction(cost: 44.99, title: 'Watch', date: DateTime.now(), id: 't1'),
    Transaction(cost: 39.99, title: 'shoes', date: DateTime.now(), id: 't2'),
  ];
  String title;
  double amount;

  void _addTransaction(String txTitle, double txAmount) {
    var tx = Transaction(
        cost: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: txTitle);
    setState(() {
      _userExpenses.add(tx);
    });
  }

  void _startAddNew(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            color: Colors.black,
            onPressed: () => _startAddNew(context),
          )
        ],
        title: Text(
          'Daily expense tracker',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Text('Chart'),
            ),
            TransactionList(_userExpenses),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNew(context),
      ),
    );
  }
}
