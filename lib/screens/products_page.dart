import 'package:bi_bak/functions.dart';
import 'package:bi_bak/screens/add_product_page.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(// -------------------------------SCAFFOLD-----------------------------
      resizeToAvoidBottomInset: false,
      appBar: AppBar(// -------------------------------AppBar-----------------------------
        centerTitle: true,
        backgroundColor: myAppBarColor,
        title: Text(// -------------------------------TITLE--------------------------
          "Bi Bak",
          style: TextStyle(fontFamily: "Fenix", fontSize: 36),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Ürün Ekleme Sayfasına yönlendirecek FloatingActionButton
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProduct()));
        },
        backgroundColor: myGreenColor,
        child: Icon(Icons.add),
      ),
      body: Container( 
        // Arkaplanı tutan Container
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/bg.jpg"), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            MyProductItem( // Ürün bilgilerinin gösterildiği MyProductItem
              productName: "Peynir",
              productAmount: "500",
              amountType: "gr",
              productCategory: "Süt ve Süt Ürünleri",
              expireDate: "12/05/2021",
            ),
            MyProductItem(
              productName: "Kıyma",
              productAmount: "1",
              amountType: "kg",
              productCategory: "Et",
              expireDate: "12/07/2021",
            ),
            MyProductItem(
              productName: "Elma",
              productAmount: "2.5",
              amountType: "kg",
              productCategory: "Meyve",
              expireDate: "10/07/2021",
            ),
            MyProductItem(
              productName: "Kola",
              productAmount: "1",
              amountType: "L",
              productCategory: "İçeçek",
              expireDate: "10/07/2022",
            ),
          ],
        ),
      ),
    );
  }
}
