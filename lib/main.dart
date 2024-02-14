import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_uploader/app.dart';
import 'package:image_uploader/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MainApp());
}
