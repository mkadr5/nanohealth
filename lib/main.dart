import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanohealth/View/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Open Sans",
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      initialBinding: AppBinding(),
      home: LoginView(),
    );
  }
}
