import 'package:flutter/material.dart';
import 'package:kwadoo_mobile/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/utils/m.dart';
import '../auth/utils/p.dart';
import '../auth/utils/g.dart';
import '../auth/login.dart';
import '../auth/home.dart';
class Unite extends StatefulWidget {


  @override
  _UniteState createState() => _UniteState();
}

class _UniteState extends State<Unite> {
  SharedPreferences sharedPreferences;
  var value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFCC2C),
        title: Text(
          "MOBILE MONEY",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color:Color(0xffFFCC2C),
          child: ListView(
            children: <Widget>[
              Container(
                height: 100,
                child: Container(
                    padding: EdgeInsets.all(30),
                    child:RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.body1,
                        children: [

                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(Icons.account_box, size: 40,),
                            ),
                          ),
                          TextSpan(text: 'Email.com',style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                ),
              ),
              ListTile(
                  title: Text('Acceuil ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15) ,),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home()));
                  }
              ),
              ListTile(
                title: Text('Historique',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15) ),
                leading: Icon(Icons.account_balance_wallet),
                onTap: () {
                  print("Clicked");
                },
              ),

              ListTile(
                title: Text('Parametre',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15) ),
                leading: Icon(Icons.settings),
                onTap: () {
                  print("Clicked");
                },
              ),
              ListTile(
                title: Text('A propos',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15) ),
                leading: Icon(Icons.info),
                onTap: () {
                  print("Clicked");
                },
              ),
              ListTile(
                title: Text('Deconnexion',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15) ),
                leading: Icon(Icons.close),
                onTap: () async{
                  sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.clear();
                  sharedPreferences.commit();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (Route<dynamic> route) => false);
                },

              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [


            //padding: EdgeInsets.only(left: 25,),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              height: 55,
              width: 380,
              decoration: BoxDecoration(
                  color: Color(0xff00ACED), borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {

                },

                child: Text(
                  'AIRTEL MONEY',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 55,
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              width: 380,
              decoration: BoxDecoration(
                  color: Color(0xff00ACED), borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {

                },

                child: Text(
                  'M-PESA',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 55,
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              width: 380,
              decoration: BoxDecoration(
                  color: Color(0xff00ACED), borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {

                },

                child: Text(
                  'ORANGE MONEY',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 55,
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              width: 380,
              decoration: BoxDecoration(
                  color: Color(0xff00ACED), borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {

                },

                child: Text(
                  'AFRICEL MONEY',
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