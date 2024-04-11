import 'package:xhs/models/card_data.dart';
import 'package:xhs/models/card_detail_data.dart';
import 'package:xhs/models/comment.dart';
import 'package:xhs/models/video.dart';

class MyPageData {
  static List<CardData> indexData = [
    CardData(
      1,
      2001,
      "assets/images/p21.png",
      "Old Money Outfit",
      "assets/images/profile.png",
      "Alice",
      1000,
      100,
      50,
    ),
    CardData(
      2,
      2002,
      "assets/images/p11.png",
      "Beautiful clothes for Spring",
      "assets/images/profile.png",
      "Alice",
      500,
      10,
      60,
    ),
    CardData(
      3,
      2003,
      "assets/images/p31.png",
      "California Cherry Blooming",
      "assets/images/profile.png",
      "Alice",
      600,
      300,
      50,
    ),
    CardData(
      4,
      2004,
      "assets/images/p41.png",
      "Kyoto Spring",
      "assets/images/profile.png",
      "Alice",
      999,
      1023,
      123,
    ),
   
  ];

  static List<CardDetailData> cardDetailDataList = [
    CardDetailData(
      1,
      2001,
      "OOTD",
      "Shanghai OOTD",
      "assets/images/profile.png",
      "Alice",
      200,
      100,
      99,
      "2024-03-28 10:30:29",
      "Shanghai",
      [
        "assets/images/p22.png",
        "assets/images/p2.png",
        "assets/images/p21.png",
      ],
    ),
    CardDetailData(
      2,
      2002,
      "Summer in CA",
      "Wear beaufitul clothes in Spring, love the season!",
      "assets/images/b1.png",
      "Alice",
      199,
      399,
      2,
      "2024-03-01 11:30:29",
      "San Diego",
      [
        "assets/images/p11.png",
        "assets/images/p1.png",
      ],
    ),
    CardDetailData(
      3,
      2003,
      "Kyoto Cherry Blooming",
      "Come to see the cherry blooming in Kyoto",
      "assets/images/profile.png",
      "Alice",
      800,
      399,
      0,
      "2023-03-27 09:28:56",
      "Kyoto",
      [
        "assets/images/p31.png",
        "assets/images/p3.png",
      ],
    ),
    CardDetailData(
      4,
      2004,
      "South Italy",
      "Enjoy south Italy",
      "assets/images/profile.png",
      "Alice",
      327,
      356,
      99,
      "2023-04-06 16:54:27",
      "Italy",
      [
        "assets/images/p4.png",
      ],
    ),
   
  ];

  static List<Comment> commentList = [
    Comment(
      1,
      "Nana",
      "assets/images/b2.png",
      "Looks amazing!",
      "2024-03-11 16:54:27",
      100,
      false,
      "Los Angeles",
    ),
    Comment(
      2,
      "momo",
      "assets/images/b3.png",
      "Great!",
      "2024-03-31 20:48:17",
      200,
      false,
      "Seattle",
    ),
  ];
}