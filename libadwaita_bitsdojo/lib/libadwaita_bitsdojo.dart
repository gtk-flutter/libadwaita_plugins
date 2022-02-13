library libadwaita_bitsdojo;

import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart' as bitsdojo;
import 'package:bitsdojo_window_platform_interface/bitsdojo_window_platform_interface.dart';
import 'package:flutter/foundation.dart';

/// To be used with AdwHeaderBar.bitsdojo, Useful when compiling the app for
/// cross platform as standard appWindow will result in error
DesktopWindow? get appWindow =>
    !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows)
        ? bitsdojo.appWindow
        : null;
