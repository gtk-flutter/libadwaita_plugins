## Minimal usage

```yaml
#pubspec.yaml
dependencies:
  adwaita:
  libadwaita:
  libadwaita_titlebar_buttons:
```

```dart
// main.dart

import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_titlebar_buttons/libadwaita_titlebar_buttons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AdwaitaThemeData.light(),
      darkTheme: AdwaitaThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AdwScaffold(
      headerbar: (_) => AdwHeaderBar(
        controls: AdwControls().titlebarButtons(),
        start: const [
          AdwHeaderButton(
            icon: Icon(Icons.nightlight_round, size: 15),
          ),
        ],
        title: const Text('Titlebar Buttons'),
      ),
      body: const Center(
        child: Text('Welcome to Titlebar Buttons Example!'),
      ),
    );
  }
}
```