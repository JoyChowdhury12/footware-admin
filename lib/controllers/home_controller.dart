import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footware_admin/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNamectrl = TextEditingController();
  TextEditingController productDescriptionctrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  @override
  void onInit() {
    productCollection = firebaseFirestore.collection("products");
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNamectrl.text,
        category: "Boots",
        description: productDescriptionctrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: "Adidas",
        image: productImgCtrl.text,
        offer: true,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar("Success!", "Product added successfully",
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    }
  }
}
