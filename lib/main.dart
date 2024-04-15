import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xhs/constants/pages.dart';
import 'package:xhs/pages/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:logger/logger.dart';

final logger = Logger();

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  logger.i('Firebase initialized');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

//   // SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
//   //   statusBarColor: Colors.transparent,
//   //   statusBarIconBrightness: Brightness.dark,
//   // );
//   // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
// }

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

