A libadwaita package for providing an extension to AdwControls for titlebar_buttons package

## Usage

First import this package at the top of your dart file 
```dart
import 'package:libadwaita_titlebar_buttons/libadwaita_titlebar_buttons.dart';
```

Then simply pass it to the controls parameter of AdwHeaderBar

```dart
AdwHeaderBar(
    controls: AdwControls().titlebarButtons(),
    ...
)
```

## Additional information

This package is dependent on `titlebar_buttons` for providing the Window object, Hence when it gets updated then this package also needs to be updated.

This package is a part of [libadwaita](https://pub.dev/packages/libadwaita) package.