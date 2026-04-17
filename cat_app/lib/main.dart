import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const CatApp());
}
