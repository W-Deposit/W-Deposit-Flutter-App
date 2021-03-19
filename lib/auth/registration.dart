import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Créer un compte'),
        leading: Container(),
      ),
      body:Container(
        padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

Container(
  padding: EdgeInsets.only(top:20,bottom: 20 ),
 child: Text('Créez un compte We-Deposit pour commencer vos opérations bancaires à distance.',style: GoogleFonts.lato(
        textStyle: TextStyle( color:Colors.black87, letterSpacing: .5,fontSize: 19,fontWeight: FontWeight.bold),
      ),),
),
Container(
  child:    TextField(
    controller: phoneController,
    decoration: const InputDecoration(
      // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      labelText: 'Email :',
    ),

  ),
),

Container(
  padding: EdgeInsets.only(top:20 ),
  child:TextField(
    controller: passwordController,
    decoration: const InputDecoration(
      labelText: 'Numero de telephone :',
    ),


  ),
),
Container(
  padding: EdgeInsets.only(top:20 ),
  child:  TextField(
  controller: passwordController,
  decoration: const InputDecoration(
    labelText: 'Mot de passe :',
  ),
  obscureText: true,

),),
            Container(
              padding: EdgeInsets.only(top:20 ),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Confrimer votre mot de passe :',
                ),
                obscureText: true,

              ) ,
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
                    "Soumettre",
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
              height: 20,
            ),
            Container(

              child:new InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                },
                child: new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Text("J'ai deja un compte We-Deposit.",style: TextStyle(color: Color(0xff7579e7),fontStyle:FontStyle.italic,decoration: TextDecoration.underline,fontSize: 15)),
                ),
              ),
            )

          ],

        ),
      ),
    );
  }

}
