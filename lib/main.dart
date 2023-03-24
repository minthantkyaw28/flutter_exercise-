import 'package:app_1/UI/LoginPage.dart';
import 'package:app_1/UI/SignUpForm.dart';
import 'package:app_1/UI/foodWidget/food_list_view.dart';
import 'package:app_1/UI/shopWidget/shop_list_view.dart';
import 'package:flutter/material.dart';

import 'UI/drawer_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Widget'),
        ),
        body: FoodListView(),
      ),
    );
  }
}
