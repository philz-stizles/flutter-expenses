import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final String text;
  final String imagePath;

  EmptyList({this.text, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.headline6,),
        SizedBox(height: 20),
        Container(
          height: 200,
          child: Image.asset(imagePath, fit: BoxFit.cover,)
        )
      ],
    );
  }
}