import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xhs/constants/pages.dart';
import 'package:xhs/pages/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:xhs/pages/splash_page/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// // deply to firebase:
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // initialise app based on platform- web or mobile
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//       apiKey: String.fromEnvironment("FIREBASE_API_KEY"),
//       authDomain: String.fromEnvironment("FIREBASE_AUTH_DOMAIN"),
//       projectId: String.fromEnvironment("FIREBASE_PROJECT_ID"),
//       storageBucket: String.fromEnvironment("FIREBASE_STORAGE_BUCKET"),
//       messagingSenderId: String.fromEnvironment("FIREBASE_MESSAGING_SENDER_ID"),
//       appId: String.fromEnvironment("FIREBASE_APP_ID"),
//       measurementId: String.fromEnvironment("FIREBASE_MEASUREMENT_ID"),
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(const MyApp());
//   // SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
//   //   statusBarColor: Colors.transparent,
//   //   statusBarIconBrightness: Brightness.dark,
//   // );
//   // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Little Red Book',
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          getPages: Routes.getPages,
          // initialRoute: Pages.home,
          initialRoute: Pages.splash,
        );
      },
    );
  }
}
