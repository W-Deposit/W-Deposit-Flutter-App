import 'package:flutter/material.dart';
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
          title: Text('Acceuil')
      ),
      body: Container(

          child: ListView(
            children: const <Widget>[
              Card(child: ListTile(title: Text("ID: W-D0000000001",textAlign: TextAlign.center,))),

              Card(
                child: ListTile(
                  dense:true,
                  leading: FlutterLogo(),
                  title: Text("ENVOYER DE L'ARGENT "),
                ),
              ),
              Card(
                child: ListTile(
                  dense:true,
                  leading: FlutterLogo(),
                  title: Text('ACHAT UNITE'),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              Card(
                child: ListTile(
                  dense:true,
                  leading: FlutterLogo(),
                  title: Text('PAYER VOS FACTURES'),
                  trailing: Icon(Icons.more_vert),
                ),
              ),



            ],
          )

      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
          child: Ink(
          decoration: ShapeDecoration(
          color: Colors.green,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(Icons.android),
          color: Colors.white,
          onPressed: () {

          },))
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Acceuil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/messages');
              },
            ),
            ListTile(
              title: Text('Recharge'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text('Mon Compte'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text('A Propos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}