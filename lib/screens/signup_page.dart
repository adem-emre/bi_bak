import 'package:bi_bak/functions.dart';

import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String userName,userSurname,userMail,userPassword;// Sırası ile kullanıcı adı, soyadı, maili, şifre bilgilerini tutmak için oluşturuldu
  
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
          child: Form(// Kullanıcı kayıt formu
            key: signUpformKey, 
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextBox(onSavedFunction: (value)=>{userName=value},textBoxHintText: "Ad",),// Kullanıcı adının girileceği TextBox
              MyTextBox(onSavedFunction: (value)=>{userSurname=value}, textBoxHintText: "Soyad",),// Kullanıcı soyadının girileceği TextBox
              MyTextBox(onSavedFunction: (value)=>{userMail=value},textBoxHintText: "E-Mail",),// Kullanıcı mailinin girileceği TextBox
              MyTextBox(onSavedFunction: (value)=>{userPassword=value},textBoxHintText: "Şifre",),// Kullanıcı şifresinin girileceği TextBox
              MyButton(// Bu buton gerekli kontroller sağlandıktan sonra kullanıcı sisteme kaydedecek
                buttonOnPressed: (){
                if(formControl(signUpformKey)){
                debugPrint("User Name Değeri : $userName");
                debugPrint("User Surname Değeri : $userSurname");
                debugPrint("User Mail Değeri : $userMail");
                debugPrint("User Password Değeri : $userPassword");
                Navigator.pop(context);
                }
           

              },buttonText: "Kaydet",buttonColor: myBlueColor,)
            ],
          )),
        ),
      ),
    );
  }
}
