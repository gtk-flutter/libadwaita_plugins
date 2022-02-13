Get platform independent appWindow object for your libadwaita app, Fixes compilation errors on mobile and web plaforms.

## Usage

First import this package at the top of your dart file 
```dart
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
```

Then simply pass the `appWindow` object to the Bitsdojo's AdwHeaderBar

```dart
AdwHeaderBar.bitsdojo(
    appWindow: appWindow,
    ...
)
```

**Note**: This package will conflict `bitsdojo_windows` appWindow object, so only import one at a time. 

## Additional information

This package is dependent on bitsdojo_window for providing the appWindow object, Hence when it gets updated then this package also needs to be updated.

This package is a part of [libadwaita](https://pub.dev/packages/libadwaita) package.