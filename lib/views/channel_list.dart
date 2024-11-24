import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/widgets/channels/channel_group.dart';

class ChannelList extends StatelessWidget {
  final List<Map<String, dynamic>> whatsappChannelList;
  const ChannelList({
    super.key,
    required this.whatsappChannelList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channels'),
        backgroundColor: const Color.fromRGBO(11, 16, 20, 1),
        actions: const [
          Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            CupertinoIcons.line_horizontal_3_decrease,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color.fromRGBO(11, 16, 20, 1),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: whatsappChannelList.length,
            itemBuilder: (context, index) {
              return ChannelGroup(
                category: whatsappChannelList[index]['category'].toString(),
                channels: whatsappChannelList[index]['channels']
                    as List<Map<String, dynamic>>,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
