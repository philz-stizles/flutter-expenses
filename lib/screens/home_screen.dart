import 'package:flutter/material.dart';
import 'package:flutter_expense/models/models.dart';
import 'package:flutter_expense/widgets/widgets.dart';


class HomeScreen extends StatefulWidget {
  // This widget is the root of your application.
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      date: txn['date']
    );

    setState(() {
      _transactions.add(newTxn);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _recentTransactions{
    return _transactions.where((txn) {
      return txn.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _toggleTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (BuildContext context) {
        return TransactionForm(_createTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: Text('Transactions'), 
      actions: [
        IconButton(icon: Icon(Icons.add), onPressed: () => _toggleTransactionModal(context))
      ],
    );

    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Column( // Column only takes as much space as its children need
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.3, 
              child: Chart(_recentTransactions)
            ),
            Container(
              height: (MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7, 
              child: TransactionListView(_transactions, _deleteTransaction)
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context, 
            builder: (_) {
              return TransactionForm(_createTransaction);
            }
          );
        },
        tooltip: 'Add transaction',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
