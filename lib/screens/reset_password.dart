import 'package:bi_bak/functions.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
 
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String resetMail; // Mail adresini tutan değişken
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
          child: Form(// Şifre Sıfırlama Formu
            key: resetPasswordformKey,child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(
                  "Şifremi Unuttum",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff361047)),
                ),
              ),
              MyTextBox(onSavedFunction:(value)=>{resetMail=value},textBoxHintText: "E-mail",), // Şifre Sıfırlama Mailinin girileceği TextBox
              MyButton(// Bu buton gerekli kontroller yapıldıktan sonra kullanıcıya şifre sıfırlama maili gönderecek
                buttonOnPressed: (){
                if(formControl(resetPasswordformKey)){
                  debugPrint("User Reset Mail Değeri : $resetMail");
                  Navigator.pop(context);
                }

              },buttonText: "Sıfırla",buttonColor: myRedColor,)

            ],
          )),
        ),
      ),
    );
  }
}