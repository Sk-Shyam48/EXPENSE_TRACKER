import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'poppins'),
      // theme: ThemeData.dark()
      //     .copyWith(scaffoldBackgroundColor: Color.fromRGBO(141, 92, 246, 1)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
