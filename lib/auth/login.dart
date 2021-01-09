import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'registration.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
bool _onChange = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      resizeToAvoidBottomPadding: true,


      body: Container(


padding: const EdgeInsets.only(top: 320,left: 15,right: 15),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/money.jpg"), fit: BoxFit.cover,)),

        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(

                children: <Widget>[

Container(
  padding: const EdgeInsets.only(bottom: 60),
  child: Text(
    "Bienvenue sur We-Deposit.Faites une transaction rapide et sécurisée sans aucun mouvement.",style: GoogleFonts.lato(
    textStyle: TextStyle( color:Colors.white, letterSpacing: .5,fontSize: 19),
  ),
  ),
),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                    obscureText: false,

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
                    height: 20,
                  ),
                  Container(
                    width: 403,
                    height: 55,
                    child:FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () async {
                        // On button presed
this.setState(() {
  _onChange==true;

});
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
                  Container(
                    child:FlatButton(
                        onPressed: () async{

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Registration()));
                        },
                      child: Text(

                      "Creer un compte We-deposit",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12.5,
                        color:Colors.white,
                      ),
                    ),

                    )
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
