import './widget/chart.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amberAccent,
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

  void _addTransaction(String txTitle, double txAmount, DateTime date) {
    var tx = Transaction(
        cost: txAmount,
        date: date,
        id: DateTime.now().toString(),
        title: txTitle);
    setState(() {
      _userExpenses.add(tx);
    });
  }

  void _startAddNew(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  List<Transaction> get _recentTransaction {
    return _userExpenses.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransaction),
            SizedBox(height: 10.0,),
            _userExpenses.length == 0
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Add new Transactions by clicking on + button on top right or bottom",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                )
                : TransactionList(_userExpenses),
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
