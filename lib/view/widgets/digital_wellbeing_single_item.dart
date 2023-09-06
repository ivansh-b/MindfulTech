import 'package:flutter/material.dart';

class DigitalWellbeingSingleItem extends StatelessWidget {
  const DigitalWellbeingSingleItem(
      {super.key, required this.name, required this.value});
  final String name, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Column(children: [
        Text(
          name,
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
