

import 'package:bi_bak/screens/products_page.dart';
import 'package:bi_bak/screens/update_product_page.dart';
import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget { // Özelleştirilmiş TextFormField Widget'ı
  String textBoxInitialValue; // Textboxın oluşturulduğan içerisindeki ilk değer
  TextEditingController
      textBoxController; // Textbox içerisinideki değeri kontrol eden değişken
  bool isEnable; // Textbox aktif mi
  Function
      onSavedFunction; // Save propertysi için oluştutulan kaydetme fonksiyonu
  double marginTop; // Textbox üst kısımdan boşluk değeri
  Function validateFunction; // Textbox validate fonksiyonu
  String textBoxHintText; // Textbox ipucu yazısı
  Color textBoxColor; // Textbox renk
  double textBoxWidth; // Textbox genişliği
  MyTextBox(
      {this.textBoxInitialValue,
      this.textBoxController,
      this.textBoxWidth,
      this.validateFunction,
      this.textBoxColor,
      @required this.textBoxHintText,
      @required this.onSavedFunction,
      this.marginTop,
      this.isEnable});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 12),
      width: textBoxWidth ?? getPhoneWidth(context) / 1.2,
      child: TextFormField(
        initialValue: textBoxInitialValue,
        controller: textBoxController,
        enabled: isEnable,
        onSaved: onSavedFunction,
        validator: isEnable == false ? null : validateFunction ?? isEmpty,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 24),
          filled: true,
          fillColor: textBoxColor ?? Colors.white,
          hintText: textBoxHintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {// Özelleştirilmiş Buton Widget'ı
  String buttonText; // Buton yazısı
  Color textColor; // Buton yazı rengi
  Color buttonColor; // Buton rengi
  Function buttonOnPressed; // Butona tıklandığında çalışacak fonksiyon
  double buttonRadius; // Buton radius değeri
  double buttonWidth; // Buton genişlik değeri
  double marginTop; // Butonun üstten boşluk değeri
  MyButton({
    @required this.buttonText,
    @required this.buttonOnPressed,
    this.buttonColor,
    this.textColor,
    this.buttonRadius,
    this.buttonWidth,
    this.marginTop,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 12),
      width: buttonWidth ?? 200,
      child: ElevatedButton(
          onPressed: buttonOnPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12),
            onPrimary: textColor ?? Colors.white,
            primary: buttonColor ?? Colors.blue,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(buttonRadius ?? 50.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          )),
    );
  }
}

class MyFridgeItem extends StatelessWidget {// Buzdolabı Item Widgetım
  String fridgeName; // Buzdolabı adını tutan değişken
  MyFridgeItem({@required this.fridgeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        gestureOnLongPress(context);
      },
      onTap: () {
        gestureOnTapped(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: myFridgeItemColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(21),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: Offset(0, 4)),
            ]),
        margin: EdgeInsets.all(15),
        height: getPhoneHeight(context) / 6,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 27),
                child: Image.asset("assets/img/fridge_icon.png")),
            Expanded(
                child: Center(
                    child: Text(
              fridgeName,
              style: TextStyle(
                  fontSize: 42, color: Colors.white, fontFamily: "Poppins"),
            )))
          ],
        ),
      ),
    );
  }
}

class MyProductItem extends StatelessWidget {
  //Ürünler sayfasındaki ürün itemlerim
  String productName; // Veritabanından gelen ürünün adını tutan değişken
  String
      productCategory; // Veritabanından gelen ürünün kategorisini tutan değişken
  String productAmount; // Veritabanından gelen ürünün miktarını tutan değişken
  String
      amountType; // Veritabanından gelen ürünün miktarının tipini tutan değişken
  String
      expireDate; // Veritabanından gelen ürünün Son Kullanma atarihini tutan değişken
  MyProductItem(
      {@required this.productName,
      @required this.productCategory,
      @required this.productAmount,
      @required this.amountType,
      this.expireDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
      height: getPhoneHeight(context) / 7.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(-6, 6)),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  productCategory,
                  style: TextStyle(
                      fontFamily: "Poppins", fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Text(
                productAmount + amountType,
                style: TextStyle(
                    fontFamily: "Poppins", fontWeight: FontWeight.w700),
              )),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("S.K. Tarihi",
                    style: TextStyle(
                      fontFamily: "Poppins",
                    )),
                Text(expireDate ?? "",
                    style: TextStyle(
                      fontFamily: "Poppins",
                    )),
              ],
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == "Düzenle") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateProduct()));
              } else if (value == "Sil") {
                deleteConfirmationDiaolog(context, false);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Düzenle', 'Sil'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}

class MyDropDown extends StatelessWidget { // Özelleştirilmiş DropDown Widgetım
  double dropDownWidth; //DropDown öğesinin genişliği
  String marginTop; // DropDown öğesinin üstten boşluğunu tutan değişken
  String value; // DropDown öğesinin değerini taşıyan değişken
  Function onChanged; // DropDown öğesinde değişim olduğunda çalışacak metod
  List<DropdownMenuItem<String>> menuItems; // Dropdown Menu itemleri
  String hintText; // DropDown ipucu yazısı
  MyDropDown(
      {@required this.dropDownWidth,
      @required this.value,
      @required this.onChanged,
      @required this.menuItems,
      @required this.hintText,
      this.marginTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dropDownWidth,
      margin: EdgeInsets.only(top: marginTop ?? 12),
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: DropdownButtonFormField<String>(
        validator: isNull,
        value: value,
        items: menuItems,
        onChanged: onChanged,
        hint: Text(
          hintText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}



final logInformKey =
    GlobalKey<FormState>(); // Login Form değerlerini kontrol etmek için
final signUpformKey =
    GlobalKey<FormState>(); // SignUp Form değerlerini kontrol etmek için
final resetPasswordformKey =
    GlobalKey<FormState>(); // ResetPassword Form değerlerini kontrol etmek için
final addProductFormKey =
    GlobalKey<FormState>(); // AddProduct Form değerlerini kontrol etmek için
final updateProductFormKey =
    GlobalKey<FormState>(); // Update Form değerlerini kontrol etmek için

Color splashBgColor = Color(0xffD8F8B7); // SplashScreen arkaplan rengi
Color myYellowColor = Color(0xffD8B91B); // Tasarımdaki sarı buton renk değeri
Color myBlueColor = Color(0xff3045B5); // Tasarımdaki mavi buton renk değeri
Color myRedColor = Color(0xffD12727); // Tasarımdaki kırmızı buton renk değeri
Color myGreenColor = Color(0xff30B535); // Tasarımdaki kırmızı buton renk değeri
Color myAppBarColor = Color(0xff890596); // Tasarımdaki mor Appbar rengi
Color myFridgeItemColor =
    Color(0xff1CC5DC); // Tasarımdaki açık mavi FridgeItem  rengi

List<DropdownMenuItem<String>> getCategoryItems() {
  //Ürün kategorilerini DropdownMenuItem olarak döndüren metod
  List<String> categories = [
    "Süt ve süt ürünleri",
    "İçecek",
    "Et",
    "Meyve",
    "Sebze",
    "Konserve",
    "Yağ",
    "Yumurta",
    "Baklagil",
    "Atıştırmalık"
  ]; //Ürün Kategori Listesi
  var categoryItemList =
      categories.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  return categoryItemList;
}

List<DropdownMenuItem<String>> getAmountTypes() {
  //Ürün Miktar Tipini DropdownMenuItem olarak döndüren metod
  List<String> categories = [
    //Ürün Miktar Tip Listesi Listesi
    "gr",
    "kg",
    "ml",
    "L",
    "adet",
  ];
  var categoryItemList =
      categories.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  return categoryItemList;
}

String isEmpty(String value) {
  // Gelen değerin boş olduğunu kontrol eden fonksiyon
  if (value.isEmpty) {
    return "Bu alan boş geçilemez";
  }
  return null;
}

String isNull(String value) {
  // Gelen değerin null olduğunu kontrol eden fonksiyon
  if (value == null) {
    return "Bu alan boş geçilemez";
  }
  return null;
}

bool formControl(GlobalKey<FormState> formKey) {
  //Form bilgilerini kontrol ettikten sonra save eden method
  if (formKey.currentState.validate()) {
    formKey.currentState.save();
    return true;
  }
  return false;
}

addFridgeItem(BuildContext context) {
  //FridgeItem eklemek için oluşturulan metod
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Buzdolabı Oluştur")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Buzdolabı adı giriniz"),
              ),
              MyButton(
                buttonText: "Kaydet",
                buttonOnPressed: () {
                  Navigator.pop(context);
                },
                buttonRadius: 0,
                buttonColor: myFridgeItemColor,
                buttonWidth: 150,
              )
            ],
          ),
        );
      });
}

updateFridgeItem(BuildContext context) {
  //FridgeItem bilgilerini güncellemek için oluşturulan metod

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Buzdolabı Düzenle")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Buzdolabı adı giriniz"),
              ),
              MyButton(
                buttonText: "Kaydet",
                buttonOnPressed: () {
                  Navigator.pop(context);
                },
                buttonRadius: 0,
                buttonColor: myFridgeItemColor,
                buttonWidth: 150,
              )
            ],
          ),
        );
      });
}

deleteFridgeItem(BuildContext context) {
  // FridgeItem öğesinin silen metod

  debugPrint("Bu FridgeItem öğesi silindi");
  Navigator.pop(context);
}

deleteProductItem(BuildContext context) {
  // ProductItem öğesinin silen metod
  debugPrint("Bu ProductItem öğesi silindi");
  Navigator.pop(context);
}

deleteConfirmationDiaolog(BuildContext context, bool isFridgeItem) {
  //Silme işlemi yaparken silme işlemini soran dialog

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Bu öğeyi silmek istediğinizden emin misiniz?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "İptal",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))),
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          if (isFridgeItem) {
                            deleteFridgeItem(context);
                          } else {
                            deleteProductItem(context);
                          }
                        },
                        child: Text(
                          "Sil",
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))),
              ],
            ),
          ),
        );
      });
}

gestureOnTapped(BuildContext context) {
  // FridgeItem öğesine tıklanıldığında ürünler sayfasına yönlendiren metod
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProductsPage()));
}

gestureOnLongPress(BuildContext context) {
  //FridgeItem öğesine uzun basıldığında karşımıza çıkacak menu
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 81,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        updateFridgeItem(context);
                      },
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Düzenle",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w300),
                          )))),
              Container(
                  height: 81,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        deleteConfirmationDiaolog(context, true);
                      },
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sil",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w300),
                          )))),
            ],
          ),
        );
      });
}

double getPhoneWidth(BuildContext context) {
  //Telefonun genişlik değerini döndüren fonksiyon
  double phoneWidth = MediaQuery.of(context).size.width;
  return phoneWidth;
}

double getPhoneHeight(BuildContext context) {
  //Telefonun yükseklik değerini döndüren fonksiyon
  double phoneWidth = MediaQuery.of(context).size.height;
  return phoneWidth;
}


