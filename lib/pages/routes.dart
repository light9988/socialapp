import 'package:xhs/constants/pages.dart';
import 'package:xhs/pages/home_page/home_page.dart';
import 'package:xhs/pages/index_page/index_detail_page/index_detail_page.dart';
import 'package:xhs/pages/init_page/init_page.dart';
import 'package:get/get.dart';
import 'package:xhs/pages/splash_page/splash_page.dart';
import 'package:xhs/pages/login_page/login_page.dart';

class Routes {
  static final List<GetPage> getPages = [
    GetPage(name: Pages.init, page: () => InitPage()),
    GetPage(name: Pages.home, page: () => HomePage()),
    GetPage(name: Pages.indexDetail, page: () => IndexDetailPage()),
    GetPage(name: Pages.splash, page: () => SplashPage()),
    GetPage(name: Pages.login, page: () => LoginPage()),
  ];
}
