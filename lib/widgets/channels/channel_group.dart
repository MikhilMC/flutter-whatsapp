import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/utils/format_string.dart';

class ChannelGroup extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> channels;

  const ChannelGroup({
    super.key,
    required this.category,
    required this.channels,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 23,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final channel = channels[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  channel['channelPhoto'],
                  scale: 1.0,
                ),
                radius: 30.0,
              ),
              title: Row(
                children: [
                  Text(
                    channel['channelName'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Image.asset(
                    "assets/icons/icons8-verify-50.png",
                    height: 20,
                  )
                ],
              ),
              subtitle: Text(
                "${FormatString.formatNumberToHumanReadable(channel['numberOfFollowers'])} followers",
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(17, 53, 42, 1),
                ),
                child: const Text(
                  "Follow",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(color: Colors.grey),
          itemCount: channels.length,
        ),
      ],
    );
  }
}
