import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final String title;
  final String price;
  final List<Color> colors;

  const AccountItem({this.title, this.price, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 150,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white, offset: Offset(2, 1), blurRadius: 8),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.2, 0.4, 0.6, 1],
              colors: colors)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            price,
            style: TextStyle(
                color:Colors.white, fontSize: 15,),
          ),
        ],
      ),
    );
  }
}