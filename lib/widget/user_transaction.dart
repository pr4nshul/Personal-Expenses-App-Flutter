import 'package:daily_expense_tracker/widget/new_transaction.dart';
import 'package:daily_expense_tracker/widget/transaction_list.dart';
import 'package:flutter/material.dart';
import '../modules/transaction.dart';
class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userExpenses = [
    Transaction(cost: 44.99, title: 'Watch', date: DateTime.now(), id: 't1'),
    Transaction(cost: 39.99, title: 'shoes', date: DateTime.now(), id: 't2'),
  ];
  String title;
  double amount;
  void _addTransaction(String txTitle , double txAmount){
    var tx = Transaction(cost: txAmount,date: DateTime.now(),id: DateTime.now().toString(),title: txTitle);
    setState(() {
      _userExpenses.add(tx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(_userExpenses),
      ],
    );
  }
}

