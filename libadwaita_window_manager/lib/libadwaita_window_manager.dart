library libadwaita_window_manager;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:libadwaita_core/libadwaita_core.dart';
import 'package:window_manager/window_manager.dart';
export 'package:libadwaita_core/libadwaita_core.dart';

final supportedPlatform =
    !kIsWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS);
WindowManager? _windowManager = supportedPlatform ? windowManager : null;

Future<void> _maximizeOrRestore() async {
  if (_windowManager == null) return;

  final isMaximized = await _windowManager!.isMaximized();
  if (!isMaximized) {
    await _windowManager?.maximize();
    return;
  }

  await _windowManager?.unmaximize();
}

extension LibAdwWindowManager on AdwActions {
  AdwActions get windowManager => AdwActions(
        onClose: _windowManager?.close,
        onMaximize: _maximizeOrRestore,
        onMinimize: _windowManager?.minimize,
        onDoubleTap: _maximizeOrRestore,
        onHeaderDrag: _windowManager?.startDragging,
        onRightClick: _windowManager?.popUpWindowMenu,
      );
}
