import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/presentation/core/app_widget.dart';

import 'library/sharedpref.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Prefs prefs = Prefs();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: AppWidget()));
}
