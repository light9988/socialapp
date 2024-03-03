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

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// deply to firebase:
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: "AIzaSyD3E4p56aamFkyUY8hk4jy3ThVEgnl346Y",
      authDomain: "xhs1-b4cdf.firebaseapp.com",
      projectId: "xhs1-b4cdf",
      storageBucket: "xhs1-b4cdf.appspot.com",
      messagingSenderId: "796910062834",
      appId: "1:796910062834:web:0b074963379ae122aa146b",
      measurementId: "G-TJ6DYE2QMR"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
  // SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   statusBarIconBrightness: Brightness.dark,
  // );
  // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

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
