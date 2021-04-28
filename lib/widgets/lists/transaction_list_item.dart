import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;


  ListItem({ @required this.title, @required this.amount, @required this.date });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Theme.of(context).primaryColor, style: BorderStyle.solid)
            ),
            child: Text('\$${amount.toStringAsFixed(2)}', style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20, 
              color: Theme.of(context).primaryColor),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title, 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(
                // DateFormat.yMMMd().format(date.toString()),
                date.toString(), 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey))
            ])
        ],
      )
    );
  }
}