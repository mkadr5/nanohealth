import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanohealth/View/list_tile.dart';
import 'package:nanohealth/View/product_detail_view.dart';
import 'package:nanohealth/ViewModels/product_view_model.dart';

class ProductsView extends StatelessWidget {
  ProductsView({Key? key}) : super(key: key);
  final ProductViewModel productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        backgroundColor: Colors.white,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: productViewModel.products.length,
            itemBuilder: (context, index) {
              final item = productViewModel.products[index];
              return InkWell(
                onTap: () => detailProduct(item.id!),
                child: CustomListTile(product: item),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          elevation: 1,
          showSelectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/Home.png"), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/Cart.png"), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/Like.png"), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/User.png"), label: ""),
          ],
        ),
      ),
    );
  }

  detailProduct(int id) {
    Get.to(ProductDetail(id: id));
  }
}
