import 'package:fbbloc/blocs/authentification_bloc/authentification_bloc_bloc.dart';
import 'package:fbbloc/blocs/sign_in_bloc/sign_in_bloc_bloc.dart';
import 'package:fbbloc/pages/auth/welcome_screen.dart';
import 'package:fbbloc/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instunder',
        theme: ThemeData.dark(),
        home: BlocBuilder<AuthentificationBlocBloc, AuthentificationBlocState>(
            builder: (context, state) {
          if (state.status == AuthentificationStatus.authentificated) {
            return BlocProvider(
              create: (context) => SignInBlocBloc(
                  userRepository:
                      context.read<AuthentificationBlocBloc>().userRepository),
              child: const BottomBarPage(),
            );
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
