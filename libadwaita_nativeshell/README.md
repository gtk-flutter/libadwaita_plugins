A libadwaita package for providing an extension to AdwActions for nativeshell package

## Usage

First import this package at the top of your dart file 
```dart
import 'package:libadwaita_nativeshell/libadwaita_nativeshell.dart';
```

Then simply pass it to the actions parameter of AdwHeaderBar

```dart
AdwHeaderBar(
    actions: AdwActions().nativeshell(context),
    ...
)
```

## Additional information

This package is dependent on `nativeshell` for providing the Window object, Hence when it gets updated then this package also needs to be updated.

This package is a part of [libadwaita](https://pub.dev/packages/libadwaita) package.