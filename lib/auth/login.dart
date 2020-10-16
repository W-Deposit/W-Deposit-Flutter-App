import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  _showMsg(msg) { //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Se connecter"),
        centerTitle: true,
        backgroundColor: Color(0xff00ACED),
      ),
      body:Padding(
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
Container(
  child: Text('Creer un compte?',style: TextStyle(color: Color(0xffFFCC2C),fontStyle:FontStyle.italic)),
)

          ],
        ),
      ),
    );
  }

}
