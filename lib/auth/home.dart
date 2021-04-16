import 'package:flutter/material.dart';
import 'package:kwadoo_mobile/services/achat.dart';
import 'package:kwadoo_mobile/services/apropos.dart';
import 'package:kwadoo_mobile/services/facture.dart';
import 'package:kwadoo_mobile/services/historique.dart';
import 'package:kwadoo_mobile/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import './utils/m.dart';
import './utils/p.dart';
import './utils/g.dart';
import '../services/deposit.dart';
import '../services/unite.dart';
import '../services/achat.dart';
import '../services/facture.dart';
class Home extends StatefulWidget {
  String value;
  Home({this.value});

  @override
  _HomeState createState() => _HomeState(value);
}

class _HomeState extends State<Home> {
  void initState() {

    super.initState();
    _read();

  }
  SharedPreferences sharedPreferences;
  String value;
  _HomeState(this.value);
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
          'Acceuil',
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
                  _read();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()));
                },
              ),
              ListTile(
                title: Text('Historique',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15) ),
                leading: Icon(Icons.account_balance_wallet),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Historique()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Apropos()));
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

   child: Column(
     children: [

       Container(
         margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
         padding: EdgeInsets.only(left: 25,),
         child:Card(
             color: Colors.white,
             elevation: 10,
             child:Padding(
               padding: EdgeInsets.all(16.0),
               child:  Text("ID: W-D0000000001",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),textAlign:TextAlign.center,),

             )


         ),


       ),
       Container(
         margin: const EdgeInsets.only(top: 25.0, bottom: 25.0),
         padding: const EdgeInsets.only(left: 10, right: 18),
         height: 110,
         child: ListView(

           padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           children: <Widget>[
             AccountItem(
                 title: "Compte en USD",
                 price: "\$250,00",
                 colors: GradientColors.green),
             AccountItem(
                 title: "Compte en FC",
                 price: "\FC 1.500,00",
                 colors: GradientColors.orange),
             AccountItem(
                 title: "Cash",
                 price: "\$800,00",
                 colors: GradientColors.green),
           ],
         ),
       ),
       Container(
           margin: const EdgeInsets.only(left: 20.0, right: 20.0),
         padding: EdgeInsets.all(10),
           color: Color(0xffECF1F4),
         child: ListTile(

             leading: const Icon(Icons.description,size: 50, color:Color(0xff00ACED)),
             title: const Text("ENVOYER DE L’ARGENT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
             subtitle: const Text('Effectuez vos transactions vers votre banque ou  votre mobile money. ',style: TextStyle(color: Colors.black)),
             onTap: () => {

             Navigator.push(
             context,
             MaterialPageRoute(
             builder: (context) => Deposit()))
             }
         )
       ),
       SizedBox(height: 20,),
       Container(
           margin: const EdgeInsets.only(left: 20.0, right: 20.0),
           padding: EdgeInsets.all(5),
           color: Color(0xffECF1F4),
           child: ListTile(

               leading: const Icon(Icons.phonelink_ring,size: 50, color:Color(0xff00ACED)),
               title: const Text("ACHAT UNITE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
               subtitle: const Text('Achetez vos unités dans tous les réseaux que vous disposez.. ',style: TextStyle(color: Colors.black)),
               onTap: () {
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => Achat()));
               }
           )
       ),
       SizedBox(height: 20,),
       Container(
           margin: const EdgeInsets.only(left: 20.0, right: 20.0),
           padding: EdgeInsets.all(5),
           color: Color(0xffECF1F4),
           child: ListTile(

               leading: const Icon(Icons.description,size: 50, color:Color(0xff00ACED)),
               title: const Text("PAYER VOS FACTURES",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
               subtitle: const Text('Effectuez vos transactions vers votre banque ou  votre mobile money. . ',style: TextStyle(color: Colors.black)),
               onTap: () {
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => Facture()));
               }
           )
       ),
     ],

   ),


      ),



    );
  }
}