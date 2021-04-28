import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListTile extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Function deleteTransaction;


  TransactionListTile({ @required this.title, @required this.amount, @required this.date, this.deleteTransaction, this.id });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                '\$${amount.toStringAsFixed(2)}', 
                // style: TextStyle(
                //   fontWeight: FontWeight.normal, 
                //   fontSize: 16, 
                //   color: Colors.white60),
              ),
            )
          )
        ),
        title: Text(
          title, 
          style: Theme.of(context).textTheme.headline6
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(date),
          // date.toString(), 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)
        ),
        trailing: IconButton(
          color: Colors.redAccent,
          icon: Icon(Icons.delete_forever_outlined),
          onPressed: () => deleteTransaction(id)),
      )
    );
    
    
//     Card(
//       child: Row(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(width: 2, color: Theme.of(context).primaryColor, style: BorderStyle.solid)
//             ),
//             child: 
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title, 
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//               Text(
//                 // DateFormat.yMMMd().format(date.toString()),
//                 date.toString(), 
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey))
//             ])
//         ],
//       )
//     );
  }
}