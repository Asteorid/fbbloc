import 'package:fbbloc/blocs/authentification_bloc/authentification_bloc_bloc.dart';
import 'package:fbbloc/screens/auth/welcome_screen.dart';
import 'package:fbbloc/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Color.fromRGBO(206, 147, 216, 1), // Light Pink
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(152, 245, 131, 1), // Baby Green
          onSecondary: Colors.white,
          tertiary: Color.fromRGBO(255, 204, 128, 1), // Your additional color
          error: Colors.red,
          outline: Color(0xFF424242), // Your additional color
        ),
      ),
      home: BlocBuilder<AuthentificationBlocBloc, AuthentificationBlocState>(
          builder: (context, state) {
        if (state.status == AuthentificationStatus.authentificated) {
          return const HomeScreen();
        } else {
          return const WelcomeScreen();
        }
      }),
    );
  }
}
