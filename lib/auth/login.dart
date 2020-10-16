import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'registration.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Se connecter",style: TextStyle(fontSize: 16),),
        centerTitle: true,
        backgroundColor: Color(0xff00ACED),
      ),
      body:Container(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
Container(
  child:Image.asset(
    'assets/logo.png',
  ),

),

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
               // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                labelText: 'Email :',
              ),

            ),

            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Mot de passe :',
              ),
              obscureText: true,

            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child:Container(
                width: 403,
                height: 55,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () async {
                    // On button presed

                    Navigator.push(
                      context,
                      MaterialPageRoute(),
                    );
                  },
                  child: Text(
                    "Connexion",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5,
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xff00ACED),

                ),
              ),

            ),
SizedBox(
  height: 5,
),
Container(
  child: FlatButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    onPressed: () async {
      // On button presed

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registration()),
      );
    },
    child: Text(

      "Creer un compte",
      style: TextStyle(

        color: Color(0xff7579e7),fontStyle:FontStyle.italic,decoration: TextDecoration.underline,fontSize: 15
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
