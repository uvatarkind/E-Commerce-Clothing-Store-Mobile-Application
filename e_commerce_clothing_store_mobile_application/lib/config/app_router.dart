import 'package:e_commerce_clothing_store_mobile_application/features/auth/screens/sign_in_screen.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/auth/screens/sign_up_screen.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/cart/presentation/pages/cart_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/navigation/presentation/pages/bottom_navigation_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/orders/presentation/pages/check_out_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/products/presentation/product_list_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/products/presentation/product_details_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/profile/presentation/pages/profile_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/profile/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/products/presentation/pages/product_detail_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationPage(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case '/products':
        return MaterialPageRoute(
          builder: (_) => const ProductListPage(),
        );
      case '/cart':
        return MaterialPageRoute(
          builder: (_) => const CartPage(),
        );
      case '/checkout':
        return MaterialPageRoute(
          builder: (_) => const CheckoutPage(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
