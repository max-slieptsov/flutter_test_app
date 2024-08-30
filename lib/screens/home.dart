import 'package:flutter/material.dart';
import '../components/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(
        title: 'Home',
      ),
      body: Center(child: Text('This is home page')),
    );
  }
}
