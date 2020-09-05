import '../modules/transaction.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double amount;
  final String day;
  final double percentage;

  ChartBar(this.amount, this.day, this.percentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child: Container(
              height: 20.0,
              child: Text(
          '\$${amount.toStringAsFixed(0)}',
          style: TextStyle(color: Colors.white),
        ),
            )),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          day,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
