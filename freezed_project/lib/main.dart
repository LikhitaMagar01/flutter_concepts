import 'package:flutter/material.dart';
import 'package:freezed_project/views/freeze_homepage.dart';
// import 'package:freezed_project/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter without Freezed'),
      home: const FreezedHomePageView(title: 'Flutter with Freezed'),
    );
  }
}
