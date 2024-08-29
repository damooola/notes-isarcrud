import 'package:flutter/material.dart';
import 'package:isarcrud/components/list_tile.dart';
import 'package:isarcrud/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            //drawerheader
            const DrawerHeader(child: Icon(Icons.note)),
            // notes tile
            MyListTile(
                text: "Notes",
                icon: const Icon(Icons.book),
                onTap: () => Navigator.pop(context)),
            //settings tile
            MyListTile(
              text: "Settings",
              icon: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
            )
          ],
        ));
  }
}
