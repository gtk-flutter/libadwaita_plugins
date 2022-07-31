## Minimal usage

- Add packages
```yaml
#pubspec.yaml
dependencies:
  adwaita:
  libadwaita:
  libadwaita_window_manager:
  window_manager:
```

- Then modify `main` function and MaterialApp's `builder` function as follows

```dart
// main.dart

import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_window_manager/libadwaita_window_manager.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(1000, 600),
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setAsFrameless();
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final virtualWindowFrameBuilder = VirtualWindowFrameInit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AdwaitaThemeData.light(),
      darkTheme: AdwaitaThemeData.dark(),
      builder: (context, child) {
      //child = myBuilder(context,child);  // do something
        child = virtualWindowFrameBuilder(context, child);
        return child;
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AdwScaffold(
      actions: AdwActions().windowManager,
      start: const [
          AdwHeaderButton(
          icon: Icon(Icons.nightlight_round, size: 15),
          ),
      ],
      title: const Text('Window manager'),
      body: const Center(
          child: Text('Welcome to Window manager Example!'),
      ),
    );
  }
}
```