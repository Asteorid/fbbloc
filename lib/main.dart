import 'dart:io';

import 'package:fbbloc/app.dart';
import 'package:fbbloc/services/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyAvj3nlNtskYXnuzuygNOaGLuoYkJvLQPM",
          appId: "1:871517290757:android:416e0d846fc6673085376c",
          messagingSenderId: "871517290757",
          projectId: "fbbloc-66144",
        ))
      : await Firebase.initializeApp();
  await sharedPreference.init();
  runApp(MyApp(FirebaseUserRepo()));
}
