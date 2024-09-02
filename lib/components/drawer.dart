import 'package:flutter/material.dart';
import 'package:isarcrud/components/drawer_tile.dart';
import 'package:isarcrud/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 250,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            //drawerheader
            const DrawerHeader(child: Icon(Icons.note)),
            // notes tile
            DrawerTile(
                text: "Notes",
                icon: const Icon(Icons.book),
                onTap: () => Navigator.pop(context)),
            //settings tile
            DrawerTile(
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
