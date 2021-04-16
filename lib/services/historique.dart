import 'package:flutter/material.dart';
import 'package:kwadoo_mobile/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/utils/m.dart';
import '../auth/utils/p.dart';
import '../auth/utils/g.dart';
import '../auth/login.dart';
import '../auth/home.dart';
import '../services/bank.dart';
import '../services/unite.dart';
class Historique extends StatefulWidget {


  @override
  _HistoriqueState createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  void initState() {

    super.initState();
    _read();

  }
  SharedPreferences sharedPreferences;
  var value;
  @override

  var username = "";
  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'email';
    final value = prefs.getString(key) ?? 0;
    print('read: $value');


    setState(() {
      username = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFCC2C),
        title: Text(
          "Historique",
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
                          TextSpan(text: username,style: TextStyle(fontWeight: FontWeight.bold)),
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
                  print(username);
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
        child: ListView(
          children: [


            //padding: EdgeInsets.only(left: 25,),

        Card(
        child: Center(
          child: Column(

            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Text("0283-0000145-60-03",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22)),
              ),
              Row(
                children: [
                  Container(

                    padding: EdgeInsets.only(right: 30,left: 5),

                    child: Text("Equity bank,",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff2F2E41),
                            fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: Text("Dépot,",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff2F2E41),
                            fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: Text("\$100",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,)),
                  ),
                  Container(

                    child: Text("Transfert",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontSize: 16)),
                  ),

                ],
              ),

            ],
          ),
        ),
      )

          ],

        ),


      ),



    );
  }
}