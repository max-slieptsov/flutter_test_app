import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'router.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
