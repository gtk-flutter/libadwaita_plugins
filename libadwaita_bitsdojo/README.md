Get platform independent appWindow object for your libadwaita app, Fixes compilation errors on mobile and web plaforms.

## Usage

First import this package at the top of your dart file 
```dart
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
```

Then simply pass it to the actions parameter of `AdwHeaderBar`

```dart
AdwHeaderBar.bitsdojo(
    actions: AdwActions().bitsdojo,
//  ...
)
```

**Note**: This package will conflict `bitsdojo_window` appWindow object, so either use this if you want cross compilation else use the original package. 

## Additional information

This package is dependent on `bitsdojo_window` for providing the appWindow object, Hence when it gets updated then this package also needs to be updated.

This package is a part of [libadwaita](https://pub.dev/packages/libadwaita) package.