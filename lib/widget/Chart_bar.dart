import '../modules/transaction.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double amount;
  final String day;
  final double percentage;

  ChartBar(this.amount, this.day, this.percentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          FittedBox(
              child: Container(
            height: constraints.maxHeight * 0.12,
            child: FittedBox(
              child: Text(
                '\$${amount.toStringAsFixed(0)}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
          SizedBox(
            height: constraints.maxHeight * 0.04,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
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
            height: constraints.maxHeight * 0.10,
          ),
          Container(
            height: constraints.maxHeight * 0.12,
            child: FittedBox(
              child: Text(
                day,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    });
  }
}
