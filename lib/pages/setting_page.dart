import 'package:flutter/material.dart';
import 'package:snake/inherited/setting_inherited.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.rounded_corner_sharp),
            title: const Text('Border'),
            value: SettingsInherited.of(context).setting.border,
            onChanged: (v) {
              SettingsInherited.of(context).setting.border = v;
              setState(() {});
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.indeterminate_check_box),
            title: const Text('Obstacules'),
            value: SettingsInherited.of(context).setting.obstacules,
            onChanged: (v) {
              SettingsInherited.of(context).setting.obstacules = v;
              setState(() {});
            },
          ),
          ListTile(
            leading: const Icon(Icons.speed),
            title: const Text('Speed'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text('Fast'),
                Expanded(
                  child: Slider(
                    value: SettingsInherited.of(context).setting.speed.toDouble(),
                    min: 100,
                    max: 900,
                    divisions: 4,
                    onChanged: (double value) {
                      print(value);
                      SettingsInherited.of(context).setting.speed = value.toInt();
                      setState(() {});
                    },
                  ),
                ),
                const Text('Slow'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
