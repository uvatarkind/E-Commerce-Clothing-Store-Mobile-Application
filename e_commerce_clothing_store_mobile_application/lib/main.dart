
import 'package:flutter/material.dart';
import 'package:e_commerce_clothing_store_mobile_application/app.dart';
import 'package:user_repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_clothing_store_mobile_application/simple_bloc_observer.dart';
import 'features/products/presentation/product_list_page.dart';
import 'features/home/presentation/pages/home_page.dart'; // <-- keep your new page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
  //runApp(const HomeApp());
  


}


void runProductListApp() {
  runApp(
    const MaterialApp(
      home: ProductListPage(),
    ),
  );
}

