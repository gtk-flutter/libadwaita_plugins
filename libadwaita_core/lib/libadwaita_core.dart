library libadwaita_core;

import 'package:flutter/material.dart';

class AdwControls {
  AdwControls({
    this.closeBtn,
    this.maximizeBtn,
    this.minimizeBtn,
  });

  final Widget? Function(VoidCallback? onClose)? closeBtn;
  final Widget? Function(VoidCallback? onMaximize)? maximizeBtn;
  final Widget? Function(VoidCallback? onMinimize)? minimizeBtn;
}

class AdwActions {
  AdwActions({
    this.onClose,
    this.onMaximize,
    this.onMinimize,
    this.onDoubleTap,
    this.onHeaderDrag,
  });

  final VoidCallback? onClose;
  final VoidCallback? onMaximize;
  final VoidCallback? onMinimize;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onHeaderDrag;
}
