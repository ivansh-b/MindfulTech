import 'package:flutter/material.dart';
import 'package:health_flutter_app/constants.dart';
import 'package:health_flutter_app/view/screens/auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedIndex = widget.initialIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff35185a),
        elevation: 0,
        title: Center(
          child: Text('MindfulTech',
              style: TextStyle(
                fontSize: 25,
              )),
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff35185a),
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.food_bank,
                ),
                label: 'Food'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.help,
                ),
                label: 'Stress Relief'),
          ]),
      drawer: Drawer(
          child: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          ListTile(
            title: Text('Log Out'),
            onTap: () {
              firebaseAuth.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          )
        ],
      )),
    );
  }
}
