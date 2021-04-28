import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function createTransaction;

  TransactionForm(this.createTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData () {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.createTransaction({
      'title': enteredTitle,
      'amount': enteredAmount,
      'date': _selectedDate
    });

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2021), 
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController
            ),
            Container(
              height: 70,
              child: Row(children: [
                Expanded(
                  child: Text((_selectedDate == null) 
                    ? 'No Date Chosen' 
                    : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}')
                ),
                TextButton(
                  onPressed: _showDatePicker, 
                  child: Text(
                    'Choose Date', 
                    style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold), )
                )
              ],),
            ),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: _submitData, 
              child: Text('Add Transaction', style: TextStyle(
                // color: Theme.of(context).textTheme.button.color
                color: Colors.white60
              ),
              )
            )
          ]
        ),
      )
    );
  }

  
  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     elevation: 5,
  //     child: Container(
  //       padding: EdgeInsets.all(10),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           TextField(
  //             decoration: InputDecoration(labelText: 'Title'),
  //             controller: _titleController
  //           ),
  //           TextField(
  //             keyboardType: TextInputType.numberWithOptions(decimal: true),
  //             decoration: InputDecoration(labelText: 'Amount'),
  //             controller: _amountController
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               createTransaction({
  //                 'title': _titleController.text,
  //                 'amount': double.parse(_amountController.text),
  //               });
  //             }, 
  //             child: Text('Add Transaction', style: TextStyle(color: Colors.purpleAccent),))
  //         ]
  //       ),
  //     )
  //   );
  // }
}