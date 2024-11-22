import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String contactPhoto;
  final String lastMessage;
  final int numberOfNewMessages;
  const ChatMessage({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.contactPhoto,
    required this.lastMessage,
    required this.numberOfNewMessages,
  });

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.78;
    bool haveNewMessages = numberOfNewMessages > 0;
    String formattedLastMessage = lastMessage.length > 50
        ? "${lastMessage.substring(0, 50)}..."
        : lastMessage;

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              contactPhoto,
              scale: 1.0,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: cWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  name != "" ? name : phoneNumber,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  formattedLastMessage,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: haveNewMessages,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 12,
              child: Text(
                numberOfNewMessages.toString(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
