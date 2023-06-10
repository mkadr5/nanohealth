import 'package:flutter_test/flutter_test.dart';
import 'package:nanohealth/Models/product.dart';
import 'package:nanohealth/Services/product_service.dart';
import 'package:nanohealth/ViewModels/product_view_model.dart';

void main() {
  group('ProductService', () {
    ProductService productService = ProductService();

    test('getProducts returns a list of products', () async {
      List<Product> products = await productService.getProducts();
      expect(products.length, greaterThan(0));
    });

    test('getProduct with valid id returns a product', () async {
      Product product = await productService.getProduct(1);
      expect(product.id, equals(1));
    });

    test('getProduct with invalid id throws an exception', () async {
      expect(() => productService.getProduct(0), throwsException);
    });
  });

  group('ProductViewModel', () {
    ProductViewModel productViewModel = ProductViewModel();

    test('fetchProducts populates products list', () async {
      await productViewModel.fetchProducts();
      expect(productViewModel.products.length, greaterThan(0));
    });

    test('fetchProductById populates selectedProduct', () async {
      await productViewModel.fetchProductById(1);
      expect(productViewModel.selectedProduct.value!.id, equals(1));
    });
  });
}
