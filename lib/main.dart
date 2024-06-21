import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unk/ukn_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(const UknApp());
}
