import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xhs/constants/pages.dart';
import 'package:flutter_xhs/pages/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // initialise app based on platform- web or mobile
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//           apiKey: "AIzaSyCy5RTH5yRQ24embbvVAfPqI54uiEAHtPY",
//           authDomain: "xhsf-d73ec.firebaseapp.com",
//           projectId: "xhsf-d73ec",
//           storageBucket: "xhsf-d73ec.appspot.com",
//           messagingSenderId: "388992575310",
//           appId: "1:388992575310:web:9a93767b5c20f822f1e01f",
//           measurementId: "G-3V7NJSC9HH"),
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
          initialRoute: Pages.home,
        );
      },
    );
  }
}
