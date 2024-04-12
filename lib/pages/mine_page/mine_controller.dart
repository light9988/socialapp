import 'package:flutter/material.dart';
import 'package:xhs/api/api_client.dart';
import 'package:xhs/constants/pages.dart';
import 'package:xhs/models/card_data.dart';
import 'package:get/get.dart';
import 'package:xhs/models/card_detail_data.dart';
import 'package:xhs/pages/mine_page/mine_page_data.dart';

class MineController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<CardData> data = [];
  List<CardDetailData> cardDetaildata = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    getIndexData();
  }

  // void getIndexData() {
  //   ApiClient().getIndexData().then((response) {
  //     data = response;
  //     update();
  //   });
  // }
  void getIndexData() {
    data = MyPageData.indexMyPageData;
    update();
  }

  void openIndexDetailPage(int id) {
    Get.toNamed(Pages.indexDetail, arguments: {"id": id});
  }

  // void openIndexDetailPage(int id) {
  //   CardDetailData cardDetailData = MyPageData.myCardDetailDataList.firstWhere((detail) => detail.id == id);
  //   Get.toNamed(Pages.indexDetail,
  //       arguments: {"id": id, "cardDetailData": cardDetailData});
  // }
}
