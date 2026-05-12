import 'package:flutter/material.dart';
import 'package:furniture_app/boarding.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColorLight: Colors.white),
      home: Boarding(),
    );
  }
}
