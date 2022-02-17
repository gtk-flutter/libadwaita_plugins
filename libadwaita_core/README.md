A libadwaita package for providing `AdwControls` and `AdwActions` for `AdwHeaderBar`

## Usage

First import this package at the top of your dart file 
```dart
import 'package:libadwaita_core/libadwaita_core.dart';
```

Then simply pass it to the actions and controls parameter of AdwHeaderBar

```dart
AdwHeaderBar(
    actions: AdwActions(
        onClose: ...,
        ...
    ),
    controls: AdwControls(
        closeBtn: (onClose) => ...,
        ...
    ),
    ...
)
```

## Additional information

This package is a part of [libadwaita](https://pub.dev/packages/libadwaita) package.