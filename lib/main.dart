import 'package:chat_sudaman_app/defines/color_defines.dart';
import 'package:chat_sudaman_app/home/home.dart';
import 'package:chat_sudaman_app/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '수다맨',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        dialogBackgroundColor: ColorDefines.bgWhite
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home()
      },
    );
  }
}