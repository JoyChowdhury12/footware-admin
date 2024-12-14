import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
          title: const Text(
            "Add Product",
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Add New Product",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold),
                ),
                const Gap(18),
                TextField(
                  controller: ctrl.productNamectrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text("Product Name"),
                    hintText: "Enter Your Product Name",
                  ),
                ),
                const Gap(18),
                TextField(
                  controller: ctrl.productDescriptionctrl,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text("Product Description"),
                    hintText: "Enter Your Product Description",
                  ),
                ),
                const Gap(18),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text("Image Url"),
                    hintText: "Enter Your Image Url",
                  ),
                ),
                const Gap(18),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text("Product Price"),
                    hintText: "Enter Your Product Price",
                  ),
                ),
                const Gap(18),
                Row(
                  children: [
                    Flexible(
                        child: DropDownBtn(
                      items: const [
                        "Boots",
                        "Sneakers",
                        "Shoe",
                        "Beach Shoes",
                        "High heels"
                      ],
                      selectedItemText: ctrl.category,
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? "general";
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: DropDownBtn(
                      items: const [
                        "Puma",
                        "Nike",
                        "Sketchers",
                        "Adidas",
                        "Clarks"
                      ],
                      selectedItemText: ctrl.brand,
                      onSelected: (selectedValue) {
                        ctrl.brand = selectedValue ?? "no branded";
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                const Gap(18),
                const Text("Offer Product?"),
                const Gap(18),
                DropDownBtn(
                  items: const ["true", "false"],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer =
                        bool.tryParse(selectedValue ?? "false") ?? false;
                    ctrl.update();
                  },
                ),
                const Gap(18),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: const Text("Add Product"))
              ],
            ),
          ),
        ),
      );
    });
  }
}
