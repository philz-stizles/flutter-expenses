import 'package:flutter/material.dart';
import 'package:flutter_expense/models/models.dart';
import 'package:flutter_expense/widgets/empty_list.dart';

import '../widgets.dart';

class TransactionListView extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionListView(this.transactions, this._deleteTransaction);

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: 300,
  //     child: ListView(
  //       children: transactions.map((txn) { // Use 'children:' for lists in which you know the length and the length is not long
  //         return ListItem(title: txn.title, amount: txn.amount, date: txn.date,);
  //       }).toList()
  //     )
  //   );
  // }

  Widget _buildListItem(BuildContext ctx, int index) {
    final txn = transactions[index];
    return TransactionListTile(id: txn.id, title: txn.title, amount: txn.amount, date: txn.date, deleteTransaction: _deleteTransaction);
  }

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty 
      ? EmptyList(text: 'No tranactions', imagePath: 'assets/images/conifer.png')
      : ListView.builder(
      itemBuilder: _buildListItem,
      itemCount: transactions.length
    );
  }
}