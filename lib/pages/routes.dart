import 'package:xhs/constants/pages.dart';
import 'package:xhs/pages/home_page/home_page.dart';
import 'package:xhs/pages/index_page/index_detail_page/index_detail_page.dart';
import 'package:xhs/pages/init_page/init_page.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> getPages = [
    GetPage(name: Pages.init, page: () => InitPage()),
    GetPage(name: Pages.home, page: () => HomePage()),
    GetPage(name: Pages.indexDetail, page: () => IndexDetailPage()),
  ];
}
