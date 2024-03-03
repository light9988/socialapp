import 'package:flutter/material.dart';
import 'package:xhs/constants/color_plate.dart';
import 'package:get/get.dart';

import 'message_controller.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);
  final MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        actions: const [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildIcon("assets/images/liked.png", "Likes&Collects", ColorPlate.primary, () {}),
                buildIcon("assets/images/user.png", "New Followers", Colors.blue, () {}),
                buildIcon("assets/images/comment2.png", "Comments & @", Colors.green, () {}),
              ],
            ),
          ),
          buildMessage(),
          buildMessage(),
          buildMessage(),
        ],
      ),
    );
  }

  Widget buildIcon(String iconPath, String text, Color color, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(iconPath, width: 30, height: 30),
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget buildMessage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 8, right: 12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/images/message.png", width: 30, height: 30),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Message Notification", style: TextStyle(fontSize: 16)),
                    Text("Sunday", style: TextStyle(fontSize: 12, color: ColorPlate.black9)),
                  ],
                ),
                Text(
                  "Event Notification: We will meet in the Spring",
                  style: TextStyle(color: ColorPlate.black9),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
