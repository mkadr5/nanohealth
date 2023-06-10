import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanohealth/Services/auth_service.dart';
import 'package:nanohealth/ViewModels/login_view_model.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}

class LoginView extends GetView<LoginViewModel> {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _emailController =
      TextEditingController(text: "mor_2314");
  final TextEditingController _passwordController =
      TextEditingController(text: "83r5^_");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(24, 128, 149, 1),
                  Color.fromRGBO(2, 179, 198, 1)
                ],
              ),
            ),
            child: Image.asset(
              "assets/images/Frame.png",
              height: 150,
              width: 150,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.55,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                    label: Text("Email"),
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(60, 60, 67, 0.36)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(60, 60, 67, 0.36)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey.shade400,
                    ),
                    label: const Text("Password"),
                    labelStyle: const TextStyle(color: Colors.black),
                    hintStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(60, 60, 67, 0.36)),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(60, 60, 67, 0.36)),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    final String email = _emailController.text;
                    final String password = _passwordController.text;
                    if (email.isNotEmpty && password.isNotEmpty) {
                      controller.login(email, password);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 74,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(42, 179, 198, 1),
                      borderRadius: BorderRadius.circular(62),
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else if (controller.error.value.isNotEmpty) {
                    return Text(controller.error.value);
                  } else {
                    print(controller.token.value);
                    return const SizedBox.shrink();
                  }
                }),
                const SizedBox(height: 40),
                const Text(
                  "NEED HELP?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 0.65),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
