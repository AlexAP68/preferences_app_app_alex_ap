import 'package:flutter/material.dart';
import 'package:preferences_app_plantilla/preferences/preferences.dart';
import 'package:preferences_app_plantilla/providers/themeproviders.dart';
import 'package:preferences_app_plantilla/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  /*bool _isDarkMode = false;
  int _genere = 1;
  String _nom = 'Jaume Camps';*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          //Añadimos un SingleChildScrollView para que se pueda hacer scroll si la pantalla es pequeña
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Añadimos los textos que queremos mostrar en este caso configuración
                const Text('Configuració',
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                const Divider(),
                //Añadimos los elementos que queremos modificar
                SwitchListTile(
                    value: Preferences.isDarkMode,
                    title: const Text('Dark Mode'),
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
                      value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                      setState(() {});
                    }),
                const Divider(),
                //En este caso añadimos un RadioListTile para poder seleccionar el género
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.genere,
                    title: const Text('Masculino'),
                    onChanged: (value) {
                      Preferences.genere = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.genere,
                    title: const Text('Femenino'),
                    onChanged: (value) {
                      Preferences.genere = value ?? 1;
                      setState(() {});
                    }),
                Divider(),
                //Añadimos un TextFormField para poder modificar el nombre
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.nom,
                    onChanged: (value) {
                      Preferences.nom = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: 'Nom', helperText: 'Nom de l\'usuari'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
