import 'package:flutter/material.dart';
import 'package:preferences_app_plantilla/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Column para que el contenido del drawer se pueda hacer scroll
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),
          //Añadimos los elementos que queremos mostrar en el drawer
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: Text('Home'),
            //Al pulsar sobre el elemento del drawer queremos que nos lleve a la pantalla de Home
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outlined),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(
                  context, SettingsScreen.routerName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
    );
  }
}
