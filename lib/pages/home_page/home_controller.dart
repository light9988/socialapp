
import 'package:flutter/material.dart';
import 'package:xhs/common/utils/public_utils.dart';
import 'package:xhs/pages/video_page/video_controller.dart';
import 'package:get/get.dart';
import 'package:xhs/pages/mine_page/mine_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:xhs/models/card_data.dart';
import 'package:xhs/pages/mine_page/mine_page_data.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

//   void onChangePage(int index) {
//     if (index == 2) {
//     } else {
//       currentIndex.value = index;
//       if (Get.find<VideoController>().videos.isNotEmpty) {
//         if (index == 1) {
//           print("Video Playing");
//           PublicUtils.setStatusBarLight();
//           Get.find<VideoController>().currentVideo.controller?.play();
//         } else {
//           print("Video Paused");
//           PublicUtils.setStatusBarDark();
//           Get.find<VideoController>().currentVideo.controller?.pause();
//         }
//       }
//     }
//   }
// }

  void onChangePage(int index,  BuildContext context) {
    if (index == 2) {
      _uploadFile(context);
    } else {
      currentIndex.value = index;
      if (Get.find<VideoController>().videos.isNotEmpty) {
        if (index == 1) {
          print("Video Playing");
          PublicUtils.setStatusBarLight();
          Get.find<VideoController>().currentVideo.controller?.play();
        } else {
          print("Video Paused");
          PublicUtils.setStatusBarDark();
          Get.find<VideoController>().currentVideo.controller?.pause();
        }
      }
    }
  }

void _uploadFile( BuildContext context) async {
  String? filePath = await FilePicker.platform.pickFiles().then((result) {
    if (result != null) {
      return result.files.single.path;
    }
    return null;
  });

  if (filePath != null) {
    // String imageName = "image_${DateTime.now().millisecondsSinceEpoch}.png";
    // String imagePath = "assets/images/$imageName";
    // File(filePath).copy(imagePath);
    // CardData newData = CardData(

    // );
    // MyPageData.indexData.add(newData);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MinePage()),
    );
  }
}

}
