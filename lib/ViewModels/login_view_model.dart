import 'dart:convert';

import 'package:nanohealth/Services/auth_service.dart';
import 'package:get/get.dart';
import 'package:nanohealth/View/product_list_view.dart';

class LoginViewModel extends GetxController {
  final AuthService _authService = Get.find();

  var isLoading = false.obs;
  var isLoggedin = false.obs;
  var error = "".obs;
  Rx<String?> token = Rxn<String>();

  void login(String username, String password) async {
    try {
      isLoading(true);
      final result = await _authService.login(username, password);
      token(jsonDecode(result)['token']);
      isLoggedin(true);
      Get.to(ProductsView());
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
