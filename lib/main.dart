import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xff0E0E2C),
            // centerTitle: true,
          )),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageDecoration = PageDecoration(
    titleTextStyle:
    PageDecoration().titleTextStyle.copyWith(color: Color(0xff003459)),
    bodyTextStyle:
    PageDecoration().bodyTextStyle.copyWith(color: Color(0xff003459)),
  );


  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset(
            'assets/spash1.png',
          ),
          decoration: const PageDecoration(
            bodyTextStyle: TextStyle(fontSize: 19, color: Color(0xff0E0E2C)),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 80, 50),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Color(0xff0E0E2C),
            ),

          titlePadding:EdgeInsets.only(bottom: 60),
            footerPadding:EdgeInsets.only(top: 80),
          ),

          title:"Services Rapides",
          body:
          "Effectuez vos transactions sur n'importe quelle plateforme de paiement sans effort avec notre application. ",
          footer: Text(
            "© Copyright 2020 We-Deposit. All Rights Reserved",
            style: TextStyle(color: Color(0xff0E0E2C)),
          )),
      PageViewModel(
        title: "Dépôt facile et Retrait",
        image: Image.asset(
          'assets/spash2.png',
        ),
        decoration: const PageDecoration(
          bodyTextStyle: TextStyle(fontSize: 19, color: Color(0xff0E0E2C)),
          imagePadding: const EdgeInsets.fromLTRB(50, 150, 80, 50),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xff0E0E2C),
          ),
            titlePadding:EdgeInsets.only(bottom: 60)
        ),
        body:
        "Il est facile d'effectuer des dépôts et d'envoyer de l'argent gratuitement à toute personne disposant l'application W-Deposit.",
      ),
      PageViewModel(
          image: Image.asset(
            'assets/spash4.png',
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Color(0xff0E0E2C),fontSize: 24,fontWeight: FontWeight.bold),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 80, 50),
            bodyTextStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Color(0xff2E41),
            ),
              titlePadding:EdgeInsets.only(bottom: 58)
          ),
          title: "Vos transactions sont très sécurisées avec l'application"+"\n"+" W-Deposit.",
          body: "",
          footer:SizedBox(
            width: 350,
            height: 60,
            child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onPressed: () async {
                // On button presed

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(

                "Demarer",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,

                ),
              ),
              color: Color(0xff00ACED),

            ),
          )
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        done: Text(
          '',
          style: TextStyle(color: Color(0xff0E0E2C), fontSize: 15.0),
        ),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
      ),
    );
  }
}
