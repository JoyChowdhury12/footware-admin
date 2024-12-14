import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'add_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Footwear Admin",
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.products[index].name ?? ""),
                subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                trailing: IconButton(
                    onPressed: () {
                      ctrl.deleteProduct(ctrl.products[index].id ?? "");
                    },
                    icon: const Icon(Icons.delete)),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const AddProductPage());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
