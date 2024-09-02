import 'package:flutter/material.dart';
import 'package:isarcrud/components/note_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEdit;
  final void Function()? onDelete;
  const NoteTile({
    super.key,
    required this.text,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 15, left: 15, right: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            // wrap iconButton in a builder so it has its own context
            trailing: Builder(
              builder: (context) => IconButton(
                  //popover dependency to use this
                  onPressed: () => showPopover(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        width: 100,
                        height: 100,
                        context: context,
                        bodyBuilder: (context) =>
                            NoteSettings(onEdit: onEdit, onDelete: onDelete),
                      ),
                  icon: const Icon(Icons.more_vert)),
            )));
  }
}
