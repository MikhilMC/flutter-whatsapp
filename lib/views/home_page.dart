import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/utils/call_logs.dart';
import 'package:flutter_whatsapp/widgets/calls/calls.dart';
import 'package:flutter_whatsapp/widgets/calls/calls_appbar.dart';
import 'package:flutter_whatsapp/widgets/chats/chats_appbar.dart';
import 'package:flutter_whatsapp/widgets/communities/communities.dart';
import 'package:flutter_whatsapp/widgets/communities/communities_appbar.dart';
import 'package:flutter_whatsapp/widgets/updates/updates.dart';
import 'package:flutter_whatsapp/widgets/updates/updates_appbar.dart';
import 'package:flutter_whatsapp/widgets/chats/chats.dart';
import 'dart:math';

enum CallType { recieved, missedCall }

enum CallDirection { incoming, outgoing }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const List<Map<String, dynamic>> chats = [
    {
      'name': 'John Doe',
      'phoneNumber': '+1234567890',
      'contactPhoto': 'https://picsum.photos/id/56/200/200',
      'lastMessage': 'Hey, are we still meeting tomorrow? Let me know!',
      'numberOfNewMessages': 3,
    },
    {
      'name': 'Alice Smith',
      'phoneNumber': '+9876543210',
      'contactPhoto': 'https://picsum.photos/id/16/200/200',
      'lastMessage': 'Don\'t forget to bring the documents.',
      'numberOfNewMessages': 1,
    },
    {
      'name': 'Uncle Bob',
      'phoneNumber': '+1122334455',
      'contactPhoto': 'https://picsum.photos/id/45/200/200',
      'lastMessage': 'Happy birthday! Hope you have a great day!',
      'numberOfNewMessages': 0,
    },
    {
      'name': '',
      'phoneNumber': '+9988776655',
      'contactPhoto': 'https://picsum.photos/id/9/200/200',
      'lastMessage': 'Hi, this is a reminder about your appointment.',
      'numberOfNewMessages': 5,
    },
    {
      'name': 'Clara Johnson',
      'phoneNumber': '+5566778899',
      'contactPhoto': 'https://picsum.photos/id/75/200/200',
      'lastMessage': 'Sure, I\'ll email you the details shortly.',
      'numberOfNewMessages': 2,
    },
    {
      'name': 'Michael Brown',
      'phoneNumber': '+4433221100',
      'contactPhoto': 'https://picsum.photos/id/72/200/200',
      'lastMessage': 'Let\'s catch up soon. Miss those old times!',
      'numberOfNewMessages': 0,
    },
    {
      'name': '',
      'phoneNumber': '+6677889900',
      'contactPhoto': 'https://picsum.photos/id/60/200/200',
      'lastMessage': 'Can you send me the report by evening?',
      'numberOfNewMessages': 4,
    },
    {
      'name': 'Emily Davis',
      'phoneNumber': '+3344556677',
      'contactPhoto': 'https://picsum.photos/id/20/200/200',
      'lastMessage': 'Thanks for the gift, I really loved it!',
      'numberOfNewMessages': 1,
    },
    {
      'name': 'Chris Wilson',
      'phoneNumber': '+7788990011',
      'contactPhoto': 'https://picsum.photos/id/92/200/200',
      'lastMessage': 'Are you available for a call this afternoon?',
      'numberOfNewMessages': 3,
    },
    {
      'name': '',
      'phoneNumber': '+9988001122',
      'contactPhoto': 'https://picsum.photos/id/63/200/200',
      'lastMessage': 'Your order has been shipped. Track your package!',
      'numberOfNewMessages': 2,
    },
  ];

  static const List<Map<String, dynamic>> channels = [
    {
      'channelName': 'John Doe',
      'channelPhoto':
          'https://placehold.co/400x400/E40121/FFFFFF/png?text=John\nDoe',
      'lastMessage': 'Hey, are we still meeting tomorrow? Let me know!',
      'numberOfNewMessages': 3,
    },
    {
      'channelName': 'Alice Smith',
      'channelPhoto':
          'https://placehold.co/400x400/3F7242/FFFFFF/png?text=Alice\nSmith',
      'lastMessage': 'Don\'t forget to bring the documents.',
      'numberOfNewMessages': 1,
    },
    {
      'channelName': 'Uncle Bob',
      'channelPhoto':
          'https://placehold.co/400x400/980BDE/FFFFFF/png?text=Uncle\nBob',
      'lastMessage': 'Happy birthday! Hope you have a great day!',
      'numberOfNewMessages': 0,
    },
    {
      'channelName': 'Clara Johnson',
      'channelPhoto':
          'https://placehold.co/400x400/223CDC/FFFFFF/png?text=Clara\nJohnson',
      'lastMessage': 'Hi, this is a reminder about your appointment.',
      'numberOfNewMessages': 5,
    },
    {
      'channelName': 'Michael Brown',
      'channelPhoto':
          'https://placehold.co/400x400/191AC9/FFFFFF/png?text=Michael\nBrown',
      'lastMessage': 'Sure, I\'ll email you the details shortly.',
      'numberOfNewMessages': 2,
    },
    {
      'channelName': 'Emily Davis',
      'channelPhoto':
          'https://placehold.co/400x400/43C658/FFFFFF/png?text=Emily\nDavis',
      'lastMessage': 'Let\'s catch up soon. Miss those old times!',
      'numberOfNewMessages': 0,
    },
    {
      'channelName': 'Chris Wilson',
      'channelPhoto':
          'https://placehold.co/400x400/0C4685/FFFFFF/png?text=Chris\nWilson',
      'lastMessage': 'Can you send me the report by evening?',
      'numberOfNewMessages': 4,
    },
    {
      'channelName': 'Sarah Carter',
      'channelPhoto':
          'https://placehold.co/400x400/6A4EFF/FFFFFF/png?text=Sarah\nCarter',
      'lastMessage': 'Thanks for the gift, I really loved it!',
      'numberOfNewMessages': 1,
    },
    {
      'channelName': 'Daniel Evans',
      'channelPhoto':
          'https://placehold.co/400x400/5F6C7F/FFFFFF/png?text=Daniel\nEvans',
      'lastMessage': 'Are you available for a call this afternoon?',
      'numberOfNewMessages': 3,
    },
    {
      'channelName': 'Rachel Green',
      'channelPhoto':
          'https://placehold.co/400x400/7FEFB5/FFFFFF/png?text=Rachel\nGreen',
      'lastMessage': 'Your order has been shipped. Track your package!',
      'numberOfNewMessages': 2,
    },
  ];

  static List<Map<String, dynamic>> communities =
      List.generate(6, (communityIndex) {
    final random = Random();
    int groupCount = random.nextInt(6) + 10;

    return {
      "id": "${communityIndex + 1}",
      "name": "Community ${communityIndex + 1}",
      "lastMessage":
          "This is the latest message for Community ${communityIndex + 1}.",
      "imageUrl": "https://picsum.photos/id/${random.nextInt(100)}/200/200",
      "groups": List.generate(groupCount, (groupIndex) {
        return {
          "id": "${communityIndex + 1}-${groupIndex + 1}",
          "name": "Group ${groupIndex + 1}",
          "memberCount": random.nextInt(50) + 10,
          "groupImage":
              "https://picsum.photos/id/${random.nextInt(100)}/200/200",
        };
      }) as List<Map<String, dynamic>>,
    };
  });

  static const List<Map<String, String>> favourites = [
    {
      "name": "Athul [GEC-IT]",
      "contactPicture": "https://picsum.photos/200/300?random=7",
    },
    {
      "name": "Gokul [GEC-IT]",
      "contactPicture": "https://picsum.photos/200/300?random=8",
    },
    {
      "name": "Akhil Muthu",
      "contactPicture": "https://picsum.photos/200/300?random=9",
    },
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<PreferredSizeWidget> _appbars = [
    const PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: ChatsAppbar(),
    ),
    const PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: UpdatesAppbar(),
    ),
    const PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: CommunitiesAppbar(),
    ),
    const PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: CallsAppbar(),
    ),
  ];

  final List<Widget> _pages = [
    const Chats(
      chats: HomePage.chats,
    ),
    Updates(
      statusProfilePictures: [
        "https://avatar.iran.liara.run/public",
        ...HomePage.chats.map((chat) => chat['contactPhoto'].toString())
      ],
      channels: HomePage.channels,
    ),
    Communities(communities: HomePage.communities),
    Calls(
      callLogs: CallLogs.generateCallLog(),
      favourites: HomePage.favourites,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbars[_selectedIndex],
      body: _pages[_selectedIndex],
      backgroundColor: const Color.fromRGBO(11, 16, 20, 1),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
        selectedIconTheme: const IconThemeData(
          applyTextScaling: true,
        ),
        unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.7),
        backgroundColor: const Color.fromRGBO(11, 16, 20, 1),
        items: [
          BottomNavigationBarItem(
            icon: Container(
                width: 45,
                height: 25,
                decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? Colors.green.shade900
                      : const Color.fromRGBO(11, 16, 20, 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Icon(Icons.chat)),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 45,
              height: 25,
              decoration: BoxDecoration(
                color: _selectedIndex == 1
                    ? Colors.green.shade900
                    : const Color.fromRGBO(11, 16, 20, 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Icon(Icons.update),
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 45,
              height: 25,
              decoration: BoxDecoration(
                color: _selectedIndex == 2
                    ? Colors.green.shade900
                    : const Color.fromRGBO(11, 16, 20, 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Icon(Icons.groups),
            ),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 45,
              height: 25,
              decoration: BoxDecoration(
                color: _selectedIndex == 3
                    ? Colors.green.shade900
                    : const Color.fromRGBO(11, 16, 20, 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Icon(Icons.call),
            ),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}
