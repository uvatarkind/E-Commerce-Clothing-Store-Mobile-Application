import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_clothing_store_mobile_application/config/app_router.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/cart/providers/cart_provider.dart';
import 'package:e_commerce_clothing_store_mobile_application/app.dart';
import 'package:user_repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_clothing_store_mobile_application/simple_bloc_observer.dart';
import 'features/products/presentation/product_list_page.dart';
import 'features/home/presentation/pages/home_page.dart'; // <-- keep your new page
import 'features/navigation/presentation/pages/bottom_navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
  //runApp(const HomeApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce Clothing Store',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}

void runProductListApp() {
  runApp(
    const MaterialApp(
      home: ProductListPage(),
    ),
  );
}
