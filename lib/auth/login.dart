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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/money.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(35.0,378,35.0,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[


            TextField(
              controller: phoneController,
              // style:
              decoration: const InputDecoration(
               // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                filled: true,
                fillColor: Colors.white,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black54),
              ),

            ),
          SizedBox(
            height: 10,
          ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Mot de passe',
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.black54),
              ),
              obscureText: true,

            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child:Container(
                width: 403,
                height: 55,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
  child: FlatButton(

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

        color: Colors.white,fontStyle:FontStyle.italic,decoration: TextDecoration.underline,fontSize: 15
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
