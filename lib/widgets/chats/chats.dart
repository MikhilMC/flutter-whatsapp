import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/widgets/chats/chat_message.dart';

class Chats extends StatelessWidget {
  final List<Map<String, dynamic>> chats;
  const Chats({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(35, 40, 44, 1),
                prefixIcon: const Icon(Icons.assistant),
                hintText: "Ask Meta AI or Search",
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverList.separated(
            itemCount: chats.length,
            itemBuilder: (context, index) => ChatMessage(
              name: chats[index]['name'].toString(),
              phoneNumber: chats[index]['phoneNumber'].toString(),
              contactPhoto: chats[index]['contactPhoto'].toString(),
              lastMessage: chats[index]['lastMessage'].toString(),
              numberOfNewMessages: chats[index]['numberOfNewMessages'],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
          ),
        ],
      ),
    );
  }
}
