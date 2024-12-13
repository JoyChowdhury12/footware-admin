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
          title: Center(
            child: Text(
              "Footwear Admin",
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Title"),
                subtitle: Text("Price : 100"),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddProductPage());
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
