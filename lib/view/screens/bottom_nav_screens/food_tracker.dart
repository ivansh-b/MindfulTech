import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_flutter_app/constants.dart';
import 'package:health_flutter_app/model/food.dart';
import 'package:health_flutter_app/view/widgets/food_item.dart';
import 'package:intl/intl.dart';

class FoodTracker extends StatefulWidget {
  const FoodTracker({super.key});

  @override
  State<FoodTracker> createState() => _FoodTrackerState();
}

class _FoodTrackerState extends State<FoodTracker> {
  Timestamp docTimestamp = Timestamp(0, 0);
  List<Food> choices = [
    Food(
        name: 'Regular Meals',
        count: 3,
        initialValue: 0,
        foodIcon: Icon(
          Icons.food_bank,
          size: 50,
          color: Colors.blue,
        )),
    Food(
        name: 'Water',
        count: 5,
        initialValue: 0,
        foodIcon: Icon(
          Icons.water,
          size: 50,
          color: Colors.blue,
        )),
    Food(
        name: 'Fruits',
        count: 3,
        initialValue: 0,
        foodIcon: Icon(
          Icons.apple,
          size: 50,
          color: Colors.blue,
        )),
    Food(
        name: 'Milk Products',
        count: 3,
        initialValue: 0,
        foodIcon: Icon(
          Icons.breakfast_dining,
          size: 50,
          color: Colors.blue,
        )),
  ];

  String date = 'Today';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // create a date object without time component

    String docIdDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    setData(docIdDate);
    setState(() {});
  }

  void setData(String id) async {
    await firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('foodData')
        .doc(id)
        .get()
        .then((value) {
      if (value.exists) {
        setState(() {
          choices[0].initialValue = value.data()!['meals'];
          choices[1].initialValue = value.data()!['water'];
          choices[2].initialValue = value.data()!['fruits'];
          choices[3].initialValue = value.data()!['milk'];
        });
      } else {
        firestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .collection('foodData')
            .doc(id)
            .set({'meals': 0, 'water': 0, 'fruits': 0, 'milk': 0});
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              'Food tracker',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(date),
              IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(Duration(days: 30)),
                        lastDate: DateTime.now());
                    if (pickedDate != null) {
                      String formatedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      setState(() {
                        date = formatedDate;
                      });
                      setData(formatedDate);
                    }
                  },
                  icon: Icon(Icons.calendar_month))
            ],
          ),
          Spacer(),
          GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(choices.length, (index) {
                return Center(
                  child: FoodItem(
                    name: choices[index].name,
                    count: choices[index].count,
                    initialValue: choices[index].initialValue,
                    foodIcon: choices[index].foodIcon,
                    index: index,
                  ),
                );
              })),
          Spacer(),
        ],
      ),
    );
  }
}
