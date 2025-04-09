import 'package:e_commerce_clothing_store_mobile_application/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/auth/screens/sign_in_screen.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-Commerce Clothing Store',
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return const HomePage();
          } else {
            return const SignInScreen();
          }
        }));
  }
}
