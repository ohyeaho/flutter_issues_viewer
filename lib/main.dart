import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/pages/home_page.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Issues Viewer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// final homePageProvider = StateNotifierProvider<HomePageStateNotifier, HomePageState>((ref) => HomePageStateNotifier());
