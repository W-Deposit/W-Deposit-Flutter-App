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
class Wedepsoit extends StatefulWidget {


  @override
  _WedepsoitState createState() => _WedepsoitState();
}

class _WedepsoitState extends State<Wedepsoit> {
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
          "Recharge - Transfert",
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
              child: Image.asset('assets/deposit.png',height: 200,),
            ),
            Container(

padding: EdgeInsets.all(5),
              child: Text('ID:W-D010000000339'+'\n'+'Type: Compte W-Deposit'+'\n'+'Name: Venceslas Josh.'+'\n'+'Solde:' +'\$'+' 2500',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
              decoration: BoxDecoration(
                color: Color(0xffFAFCFE),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],

              ),
            ),
            SizedBox(height: 20,),
            Container(

              child:  TextField(

                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Color(0xff00ACED))),
                  hintText: 'Numero du compte w-deposit',

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
                  'VALIDER OPERATION',
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