import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relatonal_database_project/Views/HomeScreens/Screens/homescreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      title: 'Blog Platform',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}