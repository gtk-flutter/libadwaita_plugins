library libadwaita_titlebar_buttons;

import 'package:libadwaita_core/libadwaita_core.dart';
import 'package:titlebar_buttons/titlebar_buttons.dart';
export 'package:libadwaita_core/libadwaita_core.dart';

extension LibAdwTitlebarButtons on AdwControls {
  AdwControls titlebarButtons([ThemeType? themeType]) => AdwControls(
        closeBtn: (onClose) => DecoratedCloseButton(
          onPressed: onClose,
          type: themeType,
        ),
        minimizeBtn: (onMinimize) => DecoratedMinimizeButton(
          onPressed: onMinimize,
          type: themeType,
        ),
        maximizeBtn: (onMaximize) => DecoratedMaximizeButton(
          onPressed: onMaximize,
          type: themeType,
        ),
      );
}
