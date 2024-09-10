import 'package:flutter/material.dart';
import 'package:jp_nursery_app/details_screen.dart';
import 'package:jp_nursery_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const routeName = '/my_app';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Japan Nursery App.',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
      routes: {
        MyApp.routeName: (context) => const MyApp(),
        DetailsScreen.routeName: (context) => const DetailsScreen(),
      },
    );
  }
}
