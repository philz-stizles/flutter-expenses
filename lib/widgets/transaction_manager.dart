import 'package:flutter/material.dart';
import 'package:flutter_expense/models/models.dart';

import 'widgets.dart';

class TransactionManager extends StatefulWidget {
  @override
  _TransactionManagerState createState() => _TransactionManagerState();
}

class _TransactionManagerState extends State<TransactionManager> {
  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Samsung phone', amount: 69.99, date:   DateTime.now()),
    Transaction(id: 't2', title: 'Draw pad', amount: 119.99, date:   DateTime.now()),
    Transaction(id: 't3', title: 'Asus laptop', amount: 659.99, date:   DateTime.now())
  ];

  void _createTransaction(Map<String, dynamic> txn) {
    final newTxn = Transaction(
      id: DateTime.now().toString(),
      title: txn['title'],
      amount: txn['amount'],
      date: DateTime.now()
    );

    setState(() {
      _transactions.add(newTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_createTransaction),
        // TransactionListView(_transactions)
      ]
    );
  }
}