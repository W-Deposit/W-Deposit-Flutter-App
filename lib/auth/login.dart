import 'package:flutter/material.dart';
import 'registration.dart';
import 'forgot.dart';
import 'home.dart';
void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 200.0,bottom: 30),
              child: Center(
                child:Text(
                  "Se Connecter", style: TextStyle(
                  fontFamily: 'Raleway',
                  package: 'awesome_package',
                  fontWeight:FontWeight.bold,
                  fontSize: 30
                ),
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Ex:abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mot de passe',
                    hintText: '*******'),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forgot()),
                );
              },
              child: Text(
                'Mot de passe oublié',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 55,
              width: 380,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  'connexion',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: FlatButton(

                onPressed: () async {
                  // On button presed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registration()),
                  );

                },
                child: Text(

                  "Creer un Compte",
                  style: TextStyle(

                      color: Colors.orange,fontStyle:FontStyle.italic,fontSize: 15
                  ),
                ),


              ),
            )

          ],
        ),
      ),
    );
  }
}