import 'package:flutter/material.dart';
import 'package:snake/models/setting.dart';

class SettingsInherited extends InheritedWidget {
  SettingsInherited({
    Key? key,
    required Widget child,
    required this.setting,
  }) : super(key: key, child: child);

  final Setting setting;

  static SettingsInherited of(BuildContext context) {
    final SettingsInherited? result =
        context.dependOnInheritedWidgetOfExactType<SettingsInherited>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
