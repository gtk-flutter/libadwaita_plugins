library libadwaita_bitsdojo;

import 'package:libadwaita_bitsdojo/src/app_window.dart';
import 'package:libadwaita_core/libadwaita_core.dart';

export 'package:libadwaita_core/libadwaita_core.dart';

export 'src/app_window.dart';

extension LibAdwBitsdojo on AdwActions {
  AdwActions get bitsdojo => AdwActions(
        onClose: appWindow?.close,
        onMaximize: appWindow?.maximizeOrRestore,
        onMinimize: appWindow?.minimize,
        onDoubleTap: appWindow?.maximizeOrRestore,
        onHeaderDrag: appWindow?.startDragging,
      );
}
