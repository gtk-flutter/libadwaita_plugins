## Minimal usage

```yaml
#pubspec.yaml
dependencies:
  adwaita:
  libadwaita:
  libadwaita_window_manager:
  window_manager:
```

```dart
// main.dart

import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(1000, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AdwaitaThemeData.light(),
      darkTheme: AdwaitaThemeData.dark(),
      builder: (context, child) {
//    child = myBuilder(context,child);  // do something
        child = DragToResizeArea(context, child!); 
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
      actions: AdwActions().windowManager(),
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