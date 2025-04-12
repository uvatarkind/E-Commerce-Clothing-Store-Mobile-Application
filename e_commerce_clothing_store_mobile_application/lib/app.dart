import 'package:e_commerce_clothing_store_mobile_application/app_view.dart';
import 'package:e_commerce_clothing_store_mobile_application/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(userRepository: userRepository),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(userRepository),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(userRepository),
        ),
      ],
      child: const MyAppView(),
    );
  }
}
