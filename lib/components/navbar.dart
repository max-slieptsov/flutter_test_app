import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    void onClick() {
      context.go('/');
    }

    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: onClick,
        ),
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {
            context.go('/todo');
          },
        ),
        IconButton(
          icon: const Icon(Icons.cloud),
          onPressed: () {
            context.go('/weather');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
