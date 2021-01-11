import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'registration.dart';
import 'home.dart';
import 'dart:convert';
import 'package:kwadoo_mobile/Controllers/dabaseHelper.dart';
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
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    if(value != '0'){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Home()));
    }
  }

  @override
  initState(){
    read();
  }
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  _onPressed(){
    setState(() {
      if(emailController.text.trim().toLowerCase().isNotEmpty &&
          passwordController.text.trim().isNotEmpty ){
        databaseHelper.loginData(emailController.text.trim().toLowerCase(),
            passwordController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password';
          }else{

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Home()));
          }
        });
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      resizeToAvoidBottomPadding: true,


      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 370,left: 15,right: 15),


          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/money.jpg"), fit: BoxFit.cover,)),

          child: Column(

            children: [
              SingleChildScrollView(
                child: Column(

                  children: <Widget>[

Container(

  padding: const EdgeInsets.only(bottom: 40),
  child: Text(
    "Bienvenue sur We-Deposit.Faites une transaction rapide et sécurisée sans aucun mouvement.",style: GoogleFonts.lato(
    textStyle: TextStyle( color:Colors.white, letterSpacing: .5,fontSize: 19),
  ),
  ),
),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
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
                        onPressed: _onPressed
,
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

                        "Je n'ai pas de compte? S'inscrire.",
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
      ),
    );
  }

  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(

                child: new Text(
                  'Close',
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );
  }
}
