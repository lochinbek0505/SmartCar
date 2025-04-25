import 'package:flutter/material.dart';
import 'package:smart_car/services/notifacation_service.dart';

import 'locale_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(const LocaleApp());
}
