import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text('Acceuil'),
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

          ],

        ),
      ),
    );
  }

}
