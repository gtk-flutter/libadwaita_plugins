A libadwaita package for providing an extension to AdwActions for window_manager package

## Usage

First import this package at the top of your dart file 
```dart
import 'package:libadwaita_window_manager/libadwaita_window_manager.dart';
```

Then simply pass it to the actions parameter of `AdwHeaderBar`

```dart
AdwHeaderBar(
    actions: AdwActions().windowManager(),
    ...
)
```

## Additional information

This package is dependent on `window_manager` for providing the WindowManager object, Hence when it gets updated then this package also needs to be updated.

This package is a part of [libadwaita](https://pub.dev/packages/libadwaita) package.