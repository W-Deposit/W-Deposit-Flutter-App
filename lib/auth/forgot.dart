import 'package:flutter/material.dart';
import 'registration.dart';
void main() {
  runApp(Forgot());
}

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}


class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 200.0,bottom: 30),
              child: Center(
                child:Text(
                  "Verification", style: TextStyle(
                    fontFamily: 'Raleway',
                    package: 'awesome_package',
                    fontWeight:FontWeight.bold,
                    fontSize: 30
                ),
                ),
              ),
            ),
            Container(
              width: 380,
              child: Text(
                "Nous vous avons envoyé sur whatsapp un code"+"\n"+" via +243 978 125 250 , veuillez le complèter pour restaurer votre mot de passe.", style: TextStyle(
              fontFamily: 'Raleway',
                  package: 'awesome_package',
                  fontSize: 15,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '333-33',
                    hintText: 'XXX-XXX'),
              ),
            ),

           SizedBox(height: 20,),
            Container(
              height: 55,
              width: 380,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {

                },
                child: Text(
                  'VERIFIER',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}