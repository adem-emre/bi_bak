import 'package:bi_bak/functions.dart';
import 'package:bi_bak/screens/login_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(// -------------------------------SCAFFOLD-----------------------------
      drawer: Drawer(// -------------------------------DRAWER-----------------------------
        child: ListView(
          children: [
            DrawerHeader(// Uygulama logosunun ve yazısının gösterileceği DrawerHeader
              decoration:BoxDecoration(color: splashBgColor),
              child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( // Uygulama logosunu tutan Container
                width: getPhoneWidth(context) / 4.2,
                child: Image.asset("assets/img/logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Text(
                  "Bi Bak", // Uygulama yazısını tutan Text
                  style: TextStyle(fontFamily: "Fenix", fontSize: 27),
                ),
              ),
            ],
          ),
        ),),

            InkWell(// Kullanıcının oturumunu sonlandırıp Giriş Sayfasına yönlendirecek Widget
              
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LogInPage()));
              },
              splashColor: myFridgeItemColor,
              child: ListTile(
                
                leading: Icon(Icons.exit_to_app,color: Colors.red,) ,title: Text("Çıkış Yap",style: TextStyle(color: Colors.red),),),
            ),
          ],
        ),
      ),
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(// -------------------------------AppBar-----------------------------
        centerTitle: true,
      backgroundColor: myAppBarColor,
           
      title: Text("Bi Bak",style: TextStyle(fontFamily: "Fenix",fontSize: 36),),// -------------------------------TITLE-----------------------------
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // Tıklanıldığında FridgeItem ekleyecek FloatingActionButton
        addFridgeItem(context);
      },backgroundColor: myFridgeItemColor,child: Icon(Icons.add),),
      
      body: Container(// -------------------------------BODY-----------------------------
        // Arkaplanı tutan Container

        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/bg.jpg"), fit: BoxFit.cover),
        ),
        child: ListView(
          // FridgeItemları tutacak ListView
          children: [
            
            MyFridgeItem(fridgeName: "Ev",), // Buzdolabı bilgilerinin gösterildiği FridgeItem
            MyFridgeItem(fridgeName: "Bodrum",),
            MyFridgeItem(fridgeName: "Ofis",),
            MyFridgeItem(fridgeName: "Yazlık",),
            MyFridgeItem(fridgeName: "Garaj",),
            

            
          ],
        ),
      ),
      
    );
  }
}

