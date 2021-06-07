import 'package:bi_bak/functions.dart';
import 'package:bi_bak/screens/main_page.dart';
import 'package:bi_bak/screens/reset_password.dart';
import 'package:bi_bak/screens/signup_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  
  String userMail; // Kullanıcının mail bilgisini tutan değişken
  String userPassword; // Kullanıcının şifre bilgisini tutan değişken

  @override
  Widget build(BuildContext context) {
    return Scaffold(// -------------------------------SCAFFOLD-----------------------------
      resizeToAvoidBottomInset: false,
      body: Container(// -------------------------------BODY--------------------------
        // Arkaplanı tutan Container
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(
                  "Hoşgeldiniz",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff361047)),
                ),
              ),
              Form( // Kullanıcı Giriş Formu
                key: logInformKey,
                child: Column(
                  children: [
                    MyTextBox( // Kullanıcı Mailinin girileceği TextBox
                      textBoxHintText: "E-mail",
                      onSavedFunction: (value) {
                        userMail = value;
                      },
                    ),
                    MyTextBox( // Kullanıcı Şifresinin girileceği TextBox
                      textBoxHintText: "Şifre",
                      onSavedFunction: (value) {
                        userPassword = value;
                      },
                    ),
                    Row(children: [
                      Container(width: getPhoneWidth(context)/2,),
                      // Şifremi Unuttumu yazısını tasarımdaki yerine hizalamak için oluşturulmuş Container
                      TextButton(onPressed: (){ // Şifremi Unuttum TextButtonu (Bu buton reset password kısımına yönlendirecek)
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordPage()));

                      }, child: Text("Şifremi Unuttum",style: TextStyle(color: myRedColor,fontWeight: FontWeight.bold,fontSize: 21),)),
                    ],),
                    MyButton(// Kullanıcıyı gerekli kontrol yapıldıkan sonra MainPage sayfasına yönlendirecek buton
                      buttonText: "Giriş Yap",buttonColor: myGreenColor,buttonOnPressed:(){
                      if(formControl(logInformKey)){
                        debugPrint("User Mail Değeri : $userMail");
                          debugPrint("User Password Değeri : $userPassword");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));

                      }
                    } ,),
                    MyButton(// Kullanıcı kayıt sayfasına yönlendirecek buton
                      buttonOnPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                    },buttonText: "Kayıt Ol", buttonColor: myYellowColor,)
                   
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


