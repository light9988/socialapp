import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xhs/constants/pages.dart';
import 'package:xhs/pages/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:xhs/pages/splash_page/splash_page.dart';
import 'package:logger/logger.dart';

final logger = Logger();

// void main() {
  // WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  logger.i('Firebase initialized');
  checkCurrentUser();
  runApp(const MyApp());
}
void checkCurrentUser() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      logger.i('No user logged in');
    } else {
      logger.i('User logged in, user ID：${user.uid}');
    }
  });
}

// // deply to firebase:
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // initialise app based on platform- web or mobile
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: String.fromEnvironment("FIREBASE_API_KEY"),
//         authDomain: String.fromEnvironment("FIREBASE_AUTH_DOMAIN"),
//         projectId: String.fromEnvironment("FIREBASE_PROJECT_ID"),
//         storageBucket: String.fromEnvironment("FIREBASE_STORAGE_BUCKET"),
//         messagingSenderId: String.fromEnvironment("FIREBASE_MESSAGING_SENDER_ID"),
//         appId: String.fromEnvironment("FIREBASE_APP_ID"),
//         measurementId: String.fromEnvironment("FIREBASE_MEASUREMENT_ID"),
//         databaseURL:String.fromEnvironment("FIREBASE_DATABASEURL"),
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   logger.i('Firebase initialized');
//   checkCurrentUser();
//   runApp(const MyApp());
// }

//   // SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
//   //   statusBarColor: Colors.transparent,
//   //   statusBarIconBrightness: Brightness.dark,
//   // );
//   // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ScreenUtilInit(
  //     designSize: const Size(750, 1334),
  //     minTextAdapt: true,
  //     splitScreenMode: true,
  //     builder: (context, child) {
  //       return GetMaterialApp(
  //         title: 'Little Red Book',
  //         builder: BotToastInit(),
  //         navigatorObservers: [BotToastNavigatorObserver()],
  //         theme: ThemeData(
  //           useMaterial3: true,
  //           primarySwatch: Colors.red,
  //         ),
  //         getPages: Routes.getPages,
  //         // initialRoute: Pages.home,
  //         initialRoute: Pages.splash,
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(750, 1334),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Little Red Book',
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.red,
            ),
            getPages: Routes.getPages,
            // initialRoute: Pages.home,
            initialRoute: Pages.splash,
          );
        },
      ),
    );
  }
}
