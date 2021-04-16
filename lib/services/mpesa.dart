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
class Mpesa extends StatefulWidget {


  @override
  _MpesaState createState() => _MpesaState();
}

class _MpesaState extends State<Mpesa> {
  void initState() {

    super.initState();
    _read();

  }
  SharedPreferences sharedPreferences;
  var value;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFCC2C),
        title: Text(
          "M-Pesa",
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
        child: ListView(
          children: [


            //padding: EdgeInsets.only(left: 25,),
            Container(
              child: Image.asset('assets/mpesa.png'),
            ),
            Container(
              child:Text('Envoyez de l’argent avec M-Pesa .',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            Container(

              child:  TextField(

                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Color(0xff00ACED))),
                  hintText: 'Entrer le numéro',

                  prefixIcon: const Icon(
                    Icons.phone_iphone,
                    color: Color(0xff00ACED),
                  ),
                ),
              ),


            ),    Container(
              padding: EdgeInsets.only(top:20 ),
              child:  TextField(

                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xff00ACED))),
                    hintText: 'Entrer le montant',


                    prefixIcon: const Icon(
                      Icons.monetization_on,
                      color: Color(0xff00ACED),
                    ),
                    prefixText: ' ',
                    suffixText: 'USD',
                    suffixStyle: const TextStyle(color: Color(0xff00ACED))),
              ),


            ),
            SizedBox(height:20),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff00ACED),
              ),
              child:FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: (){

                },
                child: Text(
                  'ENVOYER',
                  style: TextStyle(  color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],

        ),


      ),



    );
  }
}