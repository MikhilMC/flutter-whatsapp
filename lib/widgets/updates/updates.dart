import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/views/channel_list.dart';
import 'package:flutter_whatsapp/widgets/ui/message_format.dart';
import 'package:flutter_whatsapp/widgets/updates/status_view.dart';

class Updates extends StatelessWidget {
  final List<String> statusProfilePictures;
  final List<Map<String, dynamic>> channels;

  static const List<Map<String, dynamic>> whatsappChannels = [
    // General Category

    {
      'category': 'Explore Channels',
      'channels': [
        {
          'channelName': 'Daily Life Hacks',
          'channelPhoto':
              'https://dummyimage.com/300x300/1fbe78/2fda1f?text=D+L+H',
          'numberOfFollowers': 20500,
        },
        {
          'channelName': 'Travel Diaries',
          'channelPhoto':
              'https://dummyimage.com/300x300/de52a2/6526c5?text=T+D',
          'numberOfFollowers': 27000,
        },
        {
          'channelName': 'Foodie Paradise',
          'channelPhoto':
              'https://dummyimage.com/300x300/d354a3/72a577?text=F+P',
          'numberOfFollowers': 31000,
        },
        {
          'channelName': 'Photography Enthusiasts',
          'channelPhoto':
              'https://dummyimage.com/300x300/6c3b42/2800f7?text=P+E',
          'numberOfFollowers': 24500,
        },
      ],
    },
    // Technology Category
    {
      'category': 'Technology',
      'channels': [
        {
          'channelName': 'Tech World Updates',
          'channelPhoto':
              'https://dummyimage.com/300x300/5b3193/e272fd?text=T+W+U',
          'numberOfFollowers': 24000,
        },
        {
          'channelName': 'Gadget News',
          'channelPhoto':
              'https://dummyimage.com/300x300/0b5fb3/736845?text=G+N',
          'numberOfFollowers': 18000,
        },
        {
          'channelName': 'Cybersecurity Tips',
          'channelPhoto':
              'https://dummyimage.com/300x300/9987d1/36343d?text=C+T',
          'numberOfFollowers': 32000,
        },
        {
          'channelName': 'Code Breakers',
          'channelPhoto':
              'https://dummyimage.com/300x300/c3a6f5/5bc3f5?text=C+B',
          'numberOfFollowers': 15000,
        },
      ],
    },
    // Health & Fitness Category
    {
      'category': 'Health & Fitness',
      'channels': [
        {
          'channelName': 'Yoga & Wellness',
          'channelPhoto':
              'https://dummyimage.com/300x300/c86ede/519d10?text=Y+%26+W',
          'numberOfFollowers': 21000,
        },
        {
          'channelName': 'Home Workout Plans',
          'channelPhoto':
              'https://dummyimage.com/300x300/c9e005/42b3a2?text=H+W+P',
          'numberOfFollowers': 12500,
        },
        {
          'channelName': 'Nutrition Guide',
          'channelPhoto':
              'https://dummyimage.com/300x300/6a6389/960c06?text=N+G',
          'numberOfFollowers': 28500,
        },
        {
          'channelName': 'Fitness Enthusiasts',
          'channelPhoto':
              'https://dummyimage.com/300x300/d81b99/ba9171?text=F+E',
          'numberOfFollowers': 19000,
        },
      ],
    },
    // Entertainment Category
    {
      'category': 'Entertainment',
      'channels': [
        {
          'channelName': 'Movie Mania',
          'channelPhoto':
              'https://dummyimage.com/300x300/71b3b3/ad1dd3?text=M+M',
          'numberOfFollowers': 43000,
        },
        {
          'channelName': 'Music Lovers',
          'channelPhoto':
              'https://dummyimage.com/300x300/55e1ec/31a2e3?text=M+L',
          'numberOfFollowers': 38000,
        },
        {
          'channelName': 'Celebrity Gossip',
          'channelPhoto':
              'https://dummyimage.com/300x300/1c6172/847a4d?text=C+G',
          'numberOfFollowers': 27500,
        },
        {
          'channelName': 'Gaming Zone',
          'channelPhoto':
              'https://dummyimage.com/300x300/2f63f2/63949b?text=G+Z',
          'numberOfFollowers': 33000,
        },
      ],
    },
    // Education Category
    {
      'category': 'Education',
      'channels': [
        {
          'channelName': 'Learn Languages',
          'channelPhoto':
              'https://dummyimage.com/300x300/655db1/59266d?text=L+L',
          'numberOfFollowers': 15500,
        },
        {
          'channelName': 'Math Wizards',
          'channelPhoto':
              'https://dummyimage.com/300x300/d7eeb6/1e62a0?text=M+W',
          'numberOfFollowers': 14000,
        },
        {
          'channelName': 'History Hub',
          'channelPhoto':
              'https://dummyimage.com/300x300/65805e/982f29?text=H+H',
          'numberOfFollowers': 22000,
        },
        {
          'channelName': 'Science Daily',
          'channelPhoto':
              'https://dummyimage.com/300x300/e91190/6830ce?text=S+D',
          'numberOfFollowers': 29000,
        },
      ],
    },
  ];

  const Updates({
    super.key,
    required this.statusProfilePictures,
    required this.channels,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Text(
              "Status",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 23,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 140.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.separated(
                  itemBuilder: (context, index) => StatusView(
                    centerImageUrl: statusProfilePictures[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15.0,
                  ),
                  itemCount: statusProfilePictures.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Channels",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChannelList(
                        whatsappChannelList: whatsappChannels,
                      ),
                    ));
                  },
                  child: const SizedBox(
                    width: 100.0,
                    child: Row(
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.normal,
                            fontSize: 23,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverList.separated(
            itemCount: channels.length,
            itemBuilder: (context, index) => MessageFormat(
              name: channels[index]['channelName'].toString(),
              photoUrl: channels[index]['channelPhoto'].toString(),
              lastMessage: channels[index]['lastMessage'].toString(),
              numberOfNewMessages: channels[index]['numberOfNewMessages'],
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
