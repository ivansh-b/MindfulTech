import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_flutter_app/constants.dart';
import 'package:intl/intl.dart';

class FoodItem extends StatefulWidget {
  const FoodItem(
      {super.key,
      required this.name,
      required this.count,
      required this.initialValue,
      required this.foodIcon,
      required this.index});
  final String name;
  final int count;
  final int initialValue;
  final Icon foodIcon;
  final int index;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  String name = '';
  int count = 0, progressValue = 0;
  List<String> queryName = ['meals', 'water', 'fruits', 'milk'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      name = widget.name;
      count = widget.count;
      progressValue = widget.initialValue;
    });
  }

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (progressValue == count) {
          return;
        }
        String docIdDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
        firestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .collection('foodData')
            .doc(docIdDate)
            .update({
          queryName[widget.index]: progressValue + 1,
        }).then((value) {
          setState(() {
            progressValue++;
          });
        });
      },
      child: Column(
        children: [
          Container(
            child: DashedCircularProgressBar.aspectRatio(
              aspectRatio: 1.5, // width ÷ height
              valueNotifier: _valueNotifier,
              progress: (progressValue / count) * 360,
              maxProgress: 360,
              startAngle: 0,
              sweepAngle: 360,
              foregroundColor: Colors.green,
              backgroundColor: const Color(0xffeeeeee),
              foregroundStrokeWidth: 15,
              backgroundStrokeWidth: 15,
              animation: true,
              seekSize: 6,
              seekColor: const Color(0xffeeeeee),
              child: widget.foodIcon,
            ),
          ),
          Text(name),
          Text(progressValue.toString() + '/' + count.toString()),
        ],
      ),
    );
  }
}
