import 'package:flutter/material.dart';
import 'registration.dart';
import 'forgot.dart';
import 'home.dart';
import '../api/api.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String value;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool _showPassword = false;
  bool _isLoading = false;
  @override
  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = 42;
    prefs.setInt(key, value);
    print('saved $value');
  }
  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(' '),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Veuillez remplir le formulaire requis pour continuer.' ,style: TextStyle(color: Colors.orange)),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String,String> headers = {'Content-Type':'application/json'};
    final msg = jsonEncode({'email':email,'password':pass});

    var jsonResponse = null;
    var response = await http.post("https://w-deposit.herokuapp.com/api/login", body: msg,headers: headers);
    print(response);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse['wdeposit']);
      if(jsonResponse != null) {
        print(jsonResponse['username']);
        setState(() {
          _isLoading = false;
        });
        final token = jsonResponse['token'];
        final email = jsonResponse['username'];
     // final wdeposit = jsonResponse['wdeposit'];
        final prefs = await SharedPreferences.getInstance();
        final key = 'token';
        final value = token;
        prefs.setString(key, value);
        prefs.setString('email', email);
      // prefs.setString('wdeposit', wdeposit);
        print('saved $value');
        print('saved $email');
       // print('saved $wdeposit');
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()), (Route<dynamic> route) => false);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home(value:value)));
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(

        child: _isLoading? Container( width: 100, height: 70, margin: const EdgeInsets.only(top: 300,left: 150),child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Colors.orange),strokeWidth: 10,),) :Column(
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

                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    labelText: 'Email',
                    hintText: 'Ex:abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: !this._showPassword,
                controller: passwordController,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.blue)),
                  hintText: '*******',

                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.security,color: Colors.blue,),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
                ),
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
                  color: Color(0xff00ACED), borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  if(emailController.text == "" || passwordController.text == "" ){

                    setState(() {
                      _isLoading = false;
                    });
                  }else{
                    setState(() {
                      _isLoading = true;

                    });
                    signIn(emailController.text, passwordController.text);
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
  }}