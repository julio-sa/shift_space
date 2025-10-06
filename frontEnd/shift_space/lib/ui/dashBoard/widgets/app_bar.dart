import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Shift Space'),
      centerTitle: false,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}