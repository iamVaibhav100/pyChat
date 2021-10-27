import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:py_chat/materialColors/pallete.dart';
import 'package:py_chat/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PyChat',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Palette.kToDark,
          ).copyWith(
            secondary: Colors.green,
          ),
          backgroundColor: Palette.kToDark,
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.green,
              side: BorderSide(color: Colors.green),
              padding: EdgeInsets.symmetric(horizontal: 35),
            ),
          ),
        ),
        home: SplashScreen());
  }
}
