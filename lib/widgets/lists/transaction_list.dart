import 'package:flutter/material.dart';
import 'package:flutter_expense/models/models.dart';

import '../widgets.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((txn) {
            return TransactionListTile(title: txn.title, amount: txn.amount, date: txn.date,);
          }).toList()
        )
      )
    );
  }
}