import 'package:flutter/material.dart';

class MessageFormat extends StatelessWidget {
  final String name;
  final String photoUrl;
  final String lastMessage;
  final int numberOfNewMessages;
  const MessageFormat({
    super.key,
    required this.name,
    required this.photoUrl,
    required this.lastMessage,
    required this.numberOfNewMessages,
  });

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.65;
    bool haveNewMessages = numberOfNewMessages > 0;
    String formattedLastMessage = lastMessage.length > 40
        ? "${lastMessage.substring(0, 37)}..."
        : lastMessage;

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              photoUrl,
              scale: 1.0,
            ),
            radius: 40,
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
                  name,
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
