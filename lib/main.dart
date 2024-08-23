import 'package:flutter/material.dart';
import 'package:recipedia/recipepage.dart';
import 'package:recipedia/utils/styles.dart';

import 'hoempage.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Stylings.bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
    "/":(context) => Hoempage(),
   // "recipe":(context) => Recipepage(),
    },
    );
  }
}

