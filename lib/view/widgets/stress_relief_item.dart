import 'package:flutter/material.dart';

class StressReliefItem extends StatelessWidget {
  const StressReliefItem(
      {super.key,
      required this.title,
      required this.desc,
      required this.onPressed});
  final String title, desc;
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_forward))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(desc),
        ]),
      ),
    );
  }
}
