
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../functions.dart';

class UpdateProduct extends StatefulWidget {
  

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  
  String productName="Kola"; // Ürün adını tutan değişken
  String productCategory="İçecek"; // Ürün kategorisini tutan değişken
  String productAmount="2"; // Ürün miktarını tutan değişken
  String amaountType="L";// Ürün miktar tipini tutan değişken
  DateTime pickedDate; // Seçilen tarihi tutan değişken
  String expireDate="16/06/2021"; // Ürünün Son Kullanma Tarihini tutan değişken
  TextEditingController dateTextController;// Son Kullanma Tarihi textbox'ının controllerı

  @override
  void initState() {
    dateTextController = TextEditingController(text:expireDate ); 
    //Gelen veride eğer S.K. Tarihi varsa bu değer TextBox'a atanıyor
    super.initState();
  }
  
   pickDate(BuildContext context) async {
    //Tarih seçmek için oluşturulam fonksiyon
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate??DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null) {
      setState(() {
        pickedDate = date;
        dateTextController.text =
            DateFormat("dd/MM/yyyy").format(pickedDate).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(// -------------------------------SCAFFOLD-----------------------------
      resizeToAvoidBottomInset: false,
      appBar: AppBar(// -------------------------------AppBar-----------------------------
        centerTitle: true,
        backgroundColor: myAppBarColor,
        title: Text(// -------------------------------TITLE-----------------------------
          "Bi Bak",
          style: TextStyle(fontFamily: "Fenix", fontSize: 36),
        ),
      ),
      body: Container(// -------------------------------BODY-----------------------------
        // Arkaplanı tutan Container
        padding: EdgeInsets.symmetric(horizontal: 27),
        width: getPhoneWidth(context),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Form(// Ürün Güncelleme Formu
          key: updateProductFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getPhoneHeight(context)/9,),// Tasarımdaki üstten boşluk
              MyTextBox(// Ürün adının girileceği TextBox
                  textBoxInitialValue: productName,
                  textBoxHintText: "Ürün Adı",
                  onSavedFunction: (value) => {productName = value}),
              MyDropDown(// Ürün kategorisinin seçileceği DropDownButton
                
                dropDownWidth: getPhoneWidth(context)/2,
                hintText: "Kategori",
                menuItems: getCategoryItems(),
                value: productCategory,
                onChanged: (value) {
                  setState(() {
                    productCategory = value;
                    debugPrint("Kategori : $productCategory");
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextBox(// Ürün miktarının girileceği TextBox
                    textBoxInitialValue: productAmount,
                    textBoxHintText: "Miktar",
                    onSavedFunction: (value) => {productAmount = value},
                    textBoxWidth: getPhoneWidth(context) / 2,
                  ),
                  MyDropDown(// Ürün miktar türünün seçileceği DropDownButton
                    
                    dropDownWidth: getPhoneWidth(context)/4.5,
                    hintText: "Tür",
                    menuItems: getAmountTypes(),
                    onChanged: (value) {
                      setState(() {
                        amaountType = value;
                        debugPrint("Kategori : $amaountType");
                      });
                    },
                    value: amaountType,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextBox(
                      // Son Kullanma Tarihinin tutalacağı TextBox (Kullanıcı sadece DatePicker  üzerinden değer atayabilir)
                      textBoxController: dateTextController,
                      textBoxColor: Colors.grey[300],
                      isEnable: false,
                      textBoxWidth: getPhoneWidth(context) / 1.75,
                      textBoxHintText: "Son Kullanma Tarihi",
                      onSavedFunction: (value) => {expireDate = value}),
                  MyButton(
                    // Bu butona basıldığında kullanıcının karşısına DatePicker çıkacak
                    buttonColor: myYellowColor,
                    buttonRadius: 10,
                    buttonWidth: getPhoneWidth(context) / 4.5,
                    buttonText: "Seç",
                    buttonOnPressed: () {
                      pickDate(context);
                    },
                  )
                ],
              ),
              Center(
                child: MyButton(// Bu butona basıldığında kullanıcının girdiği veriler kontrol edilip ilgili veriler güncellenecek
                  marginTop: 50,buttonText: "Kaydet",buttonColor: myBlueColor, buttonOnPressed: (){
                  if(formControl(updateProductFormKey)){
                    debugPrint("Ürün Adı : $productName");
                    debugPrint("Ürün Kategori : $productCategory");
                    debugPrint("Ürün Miktarı : $productAmount");
                    debugPrint("Ürün Miktar Türü : $amaountType");
                    debugPrint("Ürün Son Kullanma Tarihi : $expireDate");
                    Navigator.pop(context);
                  }
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}