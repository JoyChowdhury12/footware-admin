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

  String category = "general";
  String brand = "no branded";
  bool offer = false;

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firebaseFirestore.collection("products");

    await fetchProduct();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNamectrl.text,
        category: category,
        description: productDescriptionctrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offer: offer,
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

  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrieveProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrieveProducts);
      Get.snackbar("Success!", "Product fetch successfully",
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProduct();
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  setValuesDefault() {
    productNamectrl.clear();
    productDescriptionctrl.clear();
    productImgCtrl.clear();
    productPriceCtrl.clear();

    category = "general";
    brand = "no branded";
    offer = false;
    update();
  }
}
