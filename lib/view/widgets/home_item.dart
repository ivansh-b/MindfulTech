import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  const HomeItem(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.imageName,
      this.textColor = Colors.white});
  final String name, imageName;
  final GestureTapCallback onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/' + imageName),
            )
            // border: Border.all(),
            //borderRadius: BorderRadius.circular(30),
            //color: Color(0xff3f4ca5),
            ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
