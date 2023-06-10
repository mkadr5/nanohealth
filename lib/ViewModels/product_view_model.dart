import 'package:get/get.dart';
import 'package:nanohealth/Models/product.dart';
import 'package:nanohealth/Services/product_service.dart';

class ProductViewModel extends GetxController {
  final ProductService _productService = ProductService();

  RxList<Product> products = <Product>[].obs;
  Rx<Product?> selectedProduct = Rxn<Product>();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      final List<Product> fetchedProducts = await _productService.getProducts();
      products.value = fetchedProducts;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchProductById(int id) async {
    try {
      final Product fetchedProduct = await _productService.getProduct(id);
      selectedProduct.value = fetchedProduct;
      update();
    } catch (e) {
      print(e);
    }
  }
}
