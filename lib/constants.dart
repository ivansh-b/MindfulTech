import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_flutter_app/view/screens/bottom_nav_screens/digital_wellbeing.dart';
import 'package:health_flutter_app/view/screens/bottom_nav_screens/food_tracker.dart';
import 'package:health_flutter_app/view/screens/bottom_nav_screens/home.dart';
import 'package:health_flutter_app/view/screens/bottom_nav_screens/stress_relief.dart';

//Screens
List<Widget> pages = [
  Home(),
  FoodTracker(),
  StressReleif(),
];

//firebase constants
var firebaseAuth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;
