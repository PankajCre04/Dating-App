import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
