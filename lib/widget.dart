import 'package:flutter/material.dart';
class Widgets{
  static drawer(BuildContext context){
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: new ListView(
          children: <Widget>[
            new Container(
              child: new DrawerHeader(
                child: new CircleAvatar(
                  child: Text("Connecte"),
                ),
              ),
            ),
            Container(
              child: Text("email"),
            ),
            Container(
              child: new Divider(
                color: Colors.white,
              ),
            ),
            Container(
              child: new ListTile(
                title: new Text("HOME",
                style: new TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )
      ),

    );
  }
}