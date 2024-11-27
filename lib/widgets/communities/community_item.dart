import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/views/community_details.dart';

class CommunityItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String imageUrl;
  final List<Map<String, dynamic>> groups;

  const CommunityItem({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.imageUrl,
    required this.groups,
  });

  @override
  Widget build(BuildContext context) {
    String showingLastMessage =
        "~ ${lastMessage.length > 45 ? "${lastMessage.substring(0, 42)}..." : lastMessage}";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.campaign,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Announcements",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      showingLastMessage,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommunityDetails(
                name: name.toString(),
                lastMessage: lastMessage.toString(),
                imageUrl: imageUrl.toString(),
                groups: groups,
              ),
            )),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 38,
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
