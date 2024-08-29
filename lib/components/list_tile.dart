import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final Icon icon;
  final void Function()? onTap;
  const MyListTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: icon,
        onTap: onTap,
      ),
    );
  }
}
