import 'package:flutter/material.dart';
import 'package:flutter_expense/models/models.dart';
import 'package:intl/intl.dart';

import '../widgets.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmount = 0.0;

      for(var i = 0; i < recentTransactions.length ; i++) {
        if(recentTransactions[i].date.day == weekDay.day 
          && recentTransactions[i].date.month == weekDay.month
          && recentTransactions[i].date.year == weekDay.year
        ) {
          totalAmount += recentTransactions[i].amount;
        }
      } 

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalAmount
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card( // Card takes the size(width & height) of its child, unless it has a parent that has a clearly defined width. 
    // If you want to add spacing, set the child to a widget like Container that you can use to set paddings or margins
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((val) {
              return ChartBar(
                label: val['day'], 
                amount: val['amount'], 
                percentOfTotal: (totalSpending <= 0.0)
                  ? 0.0
                  : (val['amount'] as double)/totalSpending ,);
            }).toList(),
        ),
      )
    );
  }
}