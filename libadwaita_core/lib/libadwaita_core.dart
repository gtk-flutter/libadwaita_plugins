library libadwaita_core;

import 'package:flutter/material.dart';

typedef AdwControlsWidget = Widget? Function(VoidCallback?);

class AdwControls {
  AdwControls({
    this.closeBtn,
    this.maximizeBtn,
    this.minimizeBtn,
  });

  final AdwControlsWidget? closeBtn;
  final AdwControlsWidget? maximizeBtn;
  final AdwControlsWidget? minimizeBtn;

  AdwControls copyWith({
    AdwControlsWidget? closeBtn,
    AdwControlsWidget? maximizeBtn,
    AdwControlsWidget? minimizeBtn,
  }) =>
      AdwControls(
        closeBtn: closeBtn ?? this.closeBtn,
        maximizeBtn: maximizeBtn ?? this.maximizeBtn,
        minimizeBtn: minimizeBtn ?? this.minimizeBtn,
      );
}

class AdwActions {
  AdwActions({
    this.onClose,
    this.onMaximize,
    this.onMinimize,
    this.onDoubleTap,
    this.onHeaderDrag,
    this.onRightClick,
  });

  final VoidCallback? onClose;
  final VoidCallback? onMaximize;
  final VoidCallback? onMinimize;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onHeaderDrag;
  final VoidCallback? onRightClick;

  AdwActions copyWith({
    VoidCallback? onClose,
    VoidCallback? onMaximize,
    VoidCallback? onMinimize,
    VoidCallback? onDoubleTap,
    VoidCallback? onHeaderDrag,
    VoidCallback? onRightClick,
  }) =>
      AdwActions(
        onClose: onClose ?? this.onClose,
        onMaximize: onMaximize ?? this.onMaximize,
        onMinimize: onMinimize ?? this.onMinimize,
        onDoubleTap: onDoubleTap ?? this.onDoubleTap,
        onHeaderDrag: onHeaderDrag ?? this.onHeaderDrag,
        onRightClick: onRightClick ?? this.onRightClick,
      );
}
