import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _isLoading = false;
  String _chosenValue;
  void _showcontent(String msg) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(' '),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text(msg ,style: TextStyle(color: Colors.orange)),
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
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  signIn(String email, pass,phone,name,gender) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String,String> headers = {'Content-Type':'application/json'};
    final msg = jsonEncode({'email':email,'password':pass,'phonenumber':phone,'firstname':name,'gender':gender});

    var jsonResponse = null;
    var response = await http.post("https://w-deposit.herokuapp.com/api/register", body: msg,headers: headers);

    print(msg);

    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        final token = jsonResponse['token'];
        final message = jsonResponse['msg'];
        final email = jsonResponse['username'];
        //  final wdeposit = jsonResponse['wdeposit'];
        final prefs = await SharedPreferences.getInstance();
        final key = 'token';
        final value = token;
        prefs.setString(key, value);
        prefs.setString('email', email);
        //   prefs.setString('wdeposit', wdeposit);
        print('saved $value');
        print('saved $email');
        // print('saved $wdeposit');
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()), (Route<dynamic> route) => false);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
      }
    }
    else {
      _showcontent(response.body);
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
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
      body:_isLoading? Container( width: 100, height: 70, margin: const EdgeInsets.only(top: 300,left: 150),child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Colors.orange),strokeWidth: 10,),) :Container(
        padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
        child: ListView(

          children: <Widget>[

Container(
  padding: EdgeInsets.only(top:20,bottom: 20 ),
 child: Text('Créez un compte We-Deposit pour commencer vos opérations bancaires à distance.',style: GoogleFonts.lato(
        textStyle: TextStyle( color:Colors.black87, letterSpacing: .5,fontSize: 19,fontWeight: FontWeight.bold),
      ),),
),
Container(
  child:    TextField(
    controller: emailController,
    decoration: const InputDecoration(
      // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      labelText: 'Email :',
    ),

  ),
),
            Container(
              child:    TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  labelText: 'Nom:',
                ),

              ),
            ),
            DropdownButton<String>(
              focusColor:Colors.white,
              value: _chosenValue,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor:Colors.black,
              items: <String>[
                ' M',
                'F',

              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style:TextStyle(color:Colors.black),),
                );
              }).toList(),
              hint:Text(
                "Choisissez votre genre:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (String value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
Container(
  padding: EdgeInsets.only(top:20 ),
  child:TextField(
    controller: phoneController,
    decoration: const InputDecoration(
      labelText: 'Numero de telephone :',
    ),


  ),
),
Container(
  padding: EdgeInsets.only(top:20 ),
  child:  TextField(

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

                    if(emailController.text == "" || passwordController.text == ""  ){

                      setState(() {
                        _isLoading = false;
                      });
                    }else{
                      setState(() {
                        _isLoading = true;

                      });
                      signIn(emailController.text, passwordController.text,phoneController.text,namecontroller.text,_chosenValue);
                    }
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
