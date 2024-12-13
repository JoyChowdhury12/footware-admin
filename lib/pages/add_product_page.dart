import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/home_controller.dart';
import '../widgets/drop_down_button.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Product",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add New Product",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold),
              ),
              Gap(18),
              TextField(
                controller: ctrl.productNamectrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Product Name"),
                  hintText: "Enter Your Product Name",
                ),
              ),
              Gap(18),
              TextField(
                controller: ctrl.productDescriptionctrl,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Product Description"),
                  hintText: "Enter Your Product Description",
                ),
              ),
              Gap(18),
              TextField(
                controller: ctrl.productImgCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Image Url"),
                  hintText: "Enter Your Image Url",
                ),
              ),
              Gap(18),
              TextField(
                controller: ctrl.productPriceCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Product Price"),
                  hintText: "Enter Your Product Price",
                ),
              ),
              Gap(18),
              Row(
                children: [
                  Flexible(
                      child: DropDownBtn(
                    items: ["cat1", "cat2", "cat3"],
                    selectedItemText: 'Category',
                    onSelected: (selectedValue) {
                      print(selectedValue);
                    },
                  )),
                  Flexible(
                      child: DropDownBtn(
                    items: ["Brand1", "Brand2", "Brand3"],
                    selectedItemText: 'Brand',
                    onSelected: (selectedValue) {
                      print(selectedValue);
                    },
                  )),
                ],
              ),
              Gap(18),
              Text("Offer Product?"),
              Gap(18),
              DropDownBtn(
                items: ["true", "false"],
                selectedItemText: 'Offer ?',
                onSelected: (selectedValue) {
                  print(selectedValue);
                },
              ),
              Gap(18),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ctrl.addProduct();
                  },
                  child: Text("Add Product"))
            ],
          ),
        ),
      );
    });
  }
}
