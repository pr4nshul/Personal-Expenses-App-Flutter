import 'package:flutter/material.dart';

class Transaction {
  @required final String id;
  @required final String title;
  @required final double cost;
  @required final DateTime date;

  Transaction({this.cost, this.date, this.title,this.id});
}
