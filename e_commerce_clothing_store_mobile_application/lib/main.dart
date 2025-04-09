// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'features/products/presentation/product_list_page.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProductListPage(),

      ),
    );
  }
}
