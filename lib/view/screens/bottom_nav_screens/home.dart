import 'package:flutter/material.dart';
import 'package:health_flutter_app/view/screens/bottom_nav_screens/digital_wellbeing.dart';
import 'package:health_flutter_app/view/screens/home_screen.dart';
import 'package:health_flutter_app/view/screens/stress_relief_screens/meditate.dart';
import 'package:health_flutter_app/view/widgets/home_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        // Center(
        //   child: Text('MindfulTech',
        //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        // ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            //color: Colors.blue[500],
            color: Color(0xff35185a),
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                  '\"Harness technology for mindfulness and wellness with MindfulTech.\"',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              // SizedBox(
              //   height: 8,
              // ),
              // Text('Additional data'.toString(),
              //     style: TextStyle(
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold,
              //     )),
            ],
          ),
        ),

        SizedBox(
          height: 16,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeItem(
                name: 'Screen Time',
                imageName: 'smartphone.jpg',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DigitalWellbeing()));
                }),
            HomeItem(
                name: 'Food Tracker',
                imageName: 'food.jpg',
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                initialIndex: 1,
                              )));
                }),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeItem(
                name: 'Stress Relief',
                imageName: 'relief.jpg',
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                initialIndex: 2,
                              )));
                }),
            HomeItem(
                name: 'Meditate',
                imageName: 'meditation.png',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MeditateScreen()));
                }),
          ],
        ),
      ],
    ));
  }
}
