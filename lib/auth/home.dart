import 'package:flutter/material.dart';
import 'package:kwadoo_mobile/widget.dart';
import 'registration.dart';
import 'forgot.dart';
import 'home.dart';
void main() => runApp(Home());

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the Main widget.
        '/': (context) => Main(),
        '/messages': (context) => Forgot(),
        '/settings': (context) => Registration()
      },
     // home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     centerTitle: true,
          title: Text('Acceuil'),
      ),
   drawer: Widgets.drawer(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              height: 400,
              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(

                  )
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
