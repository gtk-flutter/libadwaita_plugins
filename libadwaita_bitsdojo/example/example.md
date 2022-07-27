## Minimal usage

```yaml
#pubspec.yaml
dependencies:
  adwaita:
  libadwaita:
  libadwaita_bitsdojo:
```

```dart
// main.dart

import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow!;
    const initialSize = Size(400, 450);
    const size = Size(1000, 600);

    win
      ..title = 'Example Bitsdojo'
      ..size = size
      ..alignment = Alignment.center
      ..minSize = initialSize
      ..show();
  });
}

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
      actions: AdwActions().bitsdojo,
      start: const [
        AdwHeaderButton(
          icon: Icon(Icons.nightlight_round, size: 15),
        ),
      ],
      title: const Text('Bitsdojo Window'),
      body: const Center(
        child: Text('Welcome to Bitsdojo Window Example!'),
      ),
    );
  }
}
```