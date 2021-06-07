import 'dart:async';

import 'package:bi_bak/functions.dart';
import 'package:bi_bak/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp()); // -----------------------------MyApp-----------------------------
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/img/bg.jpg"), context); // Arkaplan resmini önden yükleyen fonksiyon. Bu sayede arkaplan geç yüklenmiyor   
    precacheImage(AssetImage("assets/img/logo.png"), context); // Logo resmini önden yükleyen fonksiyon. Bu sayede arkaplan geç yüklenmiyor   
    return MaterialApp(
        //-------------------------------------------MaterialApp------------------------------------
        localizationsDelegates: [
          GlobalMaterialLocalizations
              .delegate, // DatePicker nesnesinde tarihlerin türkçe gösterilmesini sağlıyor
        ],
        supportedLocales: [ // Desteklenen Diller
          const Locale("tr"),
          const Locale("en"),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: SplashScreen()); // -------------------------------HOME--------------------------
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(// Splash Screen 1 saniye gösterdikten sonra kullanıcıyı LogInPage sayfasına yönlendiriyor
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LogInPage())));
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: splashBgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( // Uygulama logosunu tutan container
                width: getPhoneWidth(context) / 1.75,
                child: Image.asset("assets/img/logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text( 
                  "Bi Bak",
                  style: TextStyle(fontFamily: "Fenix", fontSize: 54), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*

*/