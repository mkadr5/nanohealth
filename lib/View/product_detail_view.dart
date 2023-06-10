import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nanohealth/Models/product.dart';
import 'package:nanohealth/ViewModels/product_view_model.dart';

class ProductDetail extends StatelessWidget {
  final int id;
  ProductDetail({required this.id, Key? key}) : super(key: key);

  final ProductViewModel productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductViewModel>(
        init: productViewModel,
        dispose: (state) => productViewModel.selectedProduct = Rxn<Product>(),
        initState: (state) => productViewModel.fetchProductById(id),
        builder: (productController) {
          final selectedProduct = productController.selectedProduct.value;
          bool icon = false;
          if (selectedProduct == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color.fromRGBO(42, 179, 198, 1),
            ));
          } else {
            return CustomScrollView(
              anchor: 0,
              shrinkWrap: true,
              slivers: <Widget>[
                SliverAppBar(
                  onStretchTrigger: () async {
                    icon = true;
                  },
                  backgroundColor: Colors.white,
                  expandedHeight: MediaQuery.of(context).size.height * 0.7,
                  pinned: true,
                  leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 22),
                      child: Text(
                        "${selectedProduct.price} AED",
                        style: const TextStyle(
                          color: Color.fromRGBO(42, 64, 75, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    background: Image.network(
                      selectedProduct.image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 25.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Icon(
                      icon
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: const Color.fromRGBO(42, 179, 198, 1),
                      size: 35,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    //height: MediaQuery.of(context).size.height * 0.25,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(107, 127, 153, 0.25),
                                    blurRadius: 15,
                                    spreadRadius: 0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.ios_share,
                                size: 24,
                                color: Color.fromRGBO(42, 179, 198, 1),
                              ),
                            ),
                            Container(
                              width: 260,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(42, 179, 198, 1),
                                borderRadius: BorderRadius.circular(43),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(107, 127, 153, 0.25),
                                    blurRadius: 15,
                                    spreadRadius: 0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: const Center(
                                  child: Text(
                                "Order Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Color.fromRGBO(68, 75, 81, 1),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${selectedProduct.description}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(131, 131, 150, 1),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 98,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(107, 127, 153, 0.25),
                                blurRadius: 15,
                                spreadRadius: 0,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Reviews (${selectedProduct.rating?.count})",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color.fromRGBO(68, 75, 81, 1),
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 21),
                                  Text(
                                    "${selectedProduct.rating?.rate}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28,
                                      color: Color.fromRGBO(68, 75, 81, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 45),
                                  RatingBarIndicator(
                                    rating: selectedProduct.rating!.rate!,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Color.fromRGBO(255, 224, 114, 1),
                                    ),
                                    itemCount: 5,
                                    itemSize: 30.0,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
