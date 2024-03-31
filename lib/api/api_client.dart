import 'package:xhs/mock/mock.dart';

// use mock data
class ApiClient {
  ApiClient._internal();
  factory ApiClient() => _instance;
  static final ApiClient _instance = ApiClient._internal();


  Future getIndexData() async {
    await Future.delayed(const Duration(seconds: 1));
    return await Future.value(Mock.indexData);
  }

 
  Future getIndexDetailDataById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    for (var v in Mock.cardDetailDataList) {
      if (v.id == id) {
        return await Future.value(v);
      }
    }
    return null;
  }

  Future getCommentList() async {
    await Future.delayed(const Duration(seconds: 1));
    return await Future.value(Mock.commentList);
  }


  Future getVideoList() async {
    await Future.delayed(const Duration(seconds: 1));
    return await Future.value(Mock.videoList);
  }
}
