import 'package:flutter/material.dart';
import 'registration.dart';
import 'forgot.dart';
import 'home.dart';
import '../api/api.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;
void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
void displayDialog(BuildContext context, String title, String text) =>
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
              title: Text(title),
              content: Text(text)
          ),
    );
final storage = FlutterSecureStorage();

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
Future<String> attemptLogIn(String email, String password) async {
  const  baseUrl = 'https://w-deposit.herokuapp.com/api';

  Map<String,String> headers = {'Content-Type':'application/json'};
  final msg = jsonEncode({'email':email,'password':password});
  var res = await http.post(
      "$baseUrl/login",
      headers: headers,
      body: msg
  );
  print(res.body);
  if(res.statusCode == 200) return res.body;
  return null;
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
                controller: _usernameController,
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
                controller: _passwordController,
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
                onPressed: () async{
                  var username = _usernameController.text;
                  var password = _passwordController.text;

                  var token = await attemptLogIn(username, password);
                  if(token != null) {
                    storage.write(key: "jwt", value: token);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home()
                        )
                    );
                  } else {
                    displayDialog(context, "An Error Occurred", "No account was found matching that username and password");
                  }

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