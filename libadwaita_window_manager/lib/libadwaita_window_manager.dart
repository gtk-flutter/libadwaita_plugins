library libadwaita_window_manager;

import 'package:libadwaita_core/libadwaita_core.dart';
import 'package:window_manager/window_manager.dart' as wm;
export 'package:libadwaita_core/libadwaita_core.dart';

Future<void> _maximizeOrRestore() async {
  final isMaximized = await wm.windowManager.isMaximized();
  if (!isMaximized) {
    await wm.windowManager.maximize();
    return;
  }

  await wm.windowManager.unmaximize();
}

extension LibAdwWindowManager on AdwActions {
  AdwActions get windowManager => AdwActions(
        onClose: wm.windowManager.close,
        onMaximize: _maximizeOrRestore,
        onMinimize: wm.windowManager.minimize,
        onDoubleTap: _maximizeOrRestore,
        onHeaderDrag: wm.windowManager.startDragging,
        onRightClick: wm.windowManager.popUpWindowMenu,
      );
}
