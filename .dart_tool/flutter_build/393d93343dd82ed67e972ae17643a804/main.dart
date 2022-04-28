// @dart=2.12

import 'dart:ui' as ui;

import 'package:holedo_login/main.dart' as entrypoint;

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  entrypoint.main();
}
