library libadwaita_nativeshell;

import 'package:flutter/widgets.dart';
import 'package:libadwaita_core/libadwaita_core.dart';
import 'package:nativeshell/nativeshell.dart';
export 'package:libadwaita_core/libadwaita_core.dart';

// Future<void> _maximizeOrRestore(Window window) async {
//   final dynamic flags = await window.getWindowStateFlags();
//   await window.setMaximized(!(flags.maximized as bool));
// }

extension LibAdwNativeshell on AdwActions {
  AdwActions nativeshell(BuildContext context) => AdwActions(
        onClose: Window.of(context).close,
        // onMaximize: () => _maximizeOrRestore(Window.of(context)),
        // onMinimize: Window.of(context).setMinimized(true),
        // onDoubleTap: ()=>_maximizeOrRestore(Window.of(context)),
        onHeaderDrag: Window.of(context).performDrag,
      );
}
