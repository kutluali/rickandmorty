import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool transparentBackground;
  final bool hideSettings;
  const AppBarWidget({
    super.key,
    required this.title,
    this.transparentBackground = false,
    this.hideSettings = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(56);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparentBackground ? Colors.transparent : null,

      title: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [
        if (!hideSettings)
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
    );
  }
}
