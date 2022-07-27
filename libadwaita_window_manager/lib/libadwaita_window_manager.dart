library libadwaita_window_manager;

import 'package:libadwaita_core/libadwaita_core.dart';
import 'package:window_manager/window_manager.dart';
export 'package:libadwaita_core/libadwaita_core.dart';

Future<void> _maximizeOrRestore(WindowManager windowManager) async {
  final isMaximized = await windowManager.isMaximized();
  if (!isMaximized) {
    await windowManager.maximize();
    return;
  }

  await windowManager.restore();
}

extension LibAdwWindowManager on AdwActions {
  AdwActions windowManager() => AdwActions(
        onClose: WindowManager.instance.close,
        onMaximize: () => _maximizeOrRestore(WindowManager.instance),
        onMinimize: WindowManager.instance.minimize,
        onDoubleTap: () => _maximizeOrRestore(WindowManager.instance),
        onHeaderDrag: WindowManager.instance.startDragging,
      );
}
