import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/presentation/core/app_widget.dart';
import 'dart:io';
import 'library/dio_client.dart';
import 'library/routes.dart';
import 'library/sharedpref.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Prefs prefs = Prefs();
final Routes routes = Routes();
final DioClient dio = DioClient();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await prefs.init();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: AppWidget()));
}
