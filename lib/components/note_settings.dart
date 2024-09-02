import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEdit;
  final void Function()? onDelete;
  const NoteSettings({super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onEdit!,
          // icon: const Icon(Icons.edit),
          child: Text("Edit ✏️",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
        ),
        TextButton(
          onPressed: onDelete!,
          // icon: const Icon(Icons.delete),
          child: Text("Delete 🗑️",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
        ),
      ],
    );
  }
}
