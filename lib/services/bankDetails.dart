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
class BankDetails extends StatefulWidget {


  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
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
          "COORDONNEES BANCAIRES",
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
child: Text('Veuillez compléter les éléménts à board pour effectuer un transfert.',style: TextStyle(fontSize: 20,),),
            ),
            Container(
              padding: EdgeInsets.only(top:20 ),
              child:  TextField(

                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xff00ACED))),
                    hintText: 'Numero de compte',

                    prefixIcon: const Icon(
                      Icons.account_balance,
                      color: Color(0xff00ACED),
                    ),
                   ),
              ),


              ),
            Container(
              padding: EdgeInsets.only(top:20 ),
              child:  TextField(

                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xff00ACED))),
                    hintText: 'Intitulé du compte ou Nom du beneficiaire',


                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xff00ACED),
                    ),
                 ),
              ),


            ),
            Container(
              padding: EdgeInsets.only(top:20 ),
              child:  TextField(

                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xff00ACED))),
                    hintText: 'Nom du deposant',

                    prefixIcon: const Icon(
                      Icons.assignment,
                      color: Color(0xff00ACED),
                    ),
                    ),
              ),


            ),
            Container(
              padding: EdgeInsets.only(top:20 ),
              child:  TextField(

                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xff00ACED))),
                    hintText: 'Numero de telepone du beneficaire',


                    prefixIcon: const Icon(
                      Icons.phone_iphone,
                      color: Color(0xff00ACED),
                    ),
                 ),
              ),


            ),
            Container(
              padding: EdgeInsets.only(top:20 ),
              child:  TextField(

                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xff00ACED))),
                    hintText: 'Adresse du déposant',


                    prefixIcon: const Icon(
                      Icons.home,
                      color: Color(0xff00ACED),
                    ),
                   ),
              ),


            ),
            Container(
              padding: EdgeInsets.only(top:20 ),
              child:  TextField(

                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xff00ACED))),
                    hintText: 'Montant',


                    prefixIcon: const Icon(
                      Icons.monetization_on,
                      color: Color(0xff00ACED),
                    ),
                    prefixText: ' ',
                    suffixText: 'USD',
                    suffixStyle: const TextStyle(color: Color(0xff00ACED))),
              ),


            ),
            SizedBox(height: 20,),
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
                  'DEPOSER',
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