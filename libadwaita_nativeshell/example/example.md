## Minimal usage

```yaml
#pubspec.yaml
dependencies:
  adwaita:
  libadwaita:
  libadwaita_nativeshell:
  nativeshell:
```

```dart
// main.dart

import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:nativeshell/nativeshell.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AdwaitaThemeData.light(),
      darkTheme: AdwaitaThemeData.dark(),
      home: WindowWidget(
        onCreateState: (dynamic _) {
          WindowState? state;
          return state ??= MainWindowState();
        },
      ),
    );
  }
}

class MainWindowState extends WindowState {
  @override
  Future<void> initializeWindow(Size contentSize) async {
    await window.setStyle(WindowStyle(frame: WindowFrame.noTitle));
    await window.show();
  }

  @override
  WindowSizingMode get windowSizingMode =>
      WindowSizingMode.atLeastIntrinsicSize;

  @override
  Widget build(BuildContext context) {
    return WindowLayoutProbe(
      child: AdwScaffold(
        actions: AdwActions().nativeshell(context),
        start: const [
          AdwHeaderButton(
            icon: Icon(Icons.nightlight_round, size: 15),
          ),
        ],
        title: const Text('Nativeshell'),
        body: const Center(
          child: Text('Welcome to NativeShell Example!'),
        ),
      ),
    );
  }
}
```