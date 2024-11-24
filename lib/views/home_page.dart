import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/widgets/calls/calls_appbar.dart';
import 'package:flutter_whatsapp/widgets/chats/chats_appbar.dart';
import 'package:flutter_whatsapp/widgets/communities/communities_appbar.dart';
import 'package:flutter_whatsapp/widgets/updates/updates.dart';
import 'package:flutter_whatsapp/widgets/updates/updates_appbar.dart';
import 'package:flutter_whatsapp/widgets/chats/chats.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const List<Map<String, dynamic>> chats = [
    {
      'name': 'John Doe',
      'phoneNumber': '+1234567890',
      'contactPhoto': 'https://picsum.photos/id/0/200/200',
      'lastMessage': 'Hey, are we still meeting tomorrow? Let me know!',
      'numberOfNewMessages': 3,
    },
    {
      'name': 'Alice Smith',
      'phoneNumber': '+9876543210',
      'contactPhoto': 'https://picsum.photos/id/1/200/200',
      'lastMessage': 'Don\'t forget to bring the documents.',
      'numberOfNewMessages': 1,
    },
    {
      'name': 'Uncle Bob',
      'phoneNumber': '+1122334455',
      'contactPhoto': 'https://picsum.photos/id/2/200/200',
      'lastMessage': 'Happy birthday! Hope you have a great day!',
      'numberOfNewMessages': 0,
    },
    {
      'name': '',
      'phoneNumber': '+9988776655',
      'contactPhoto': 'https://picsum.photos/id/3/200/200',
      'lastMessage': 'Hi, this is a reminder about your appointment.',
      'numberOfNewMessages': 5,
    },
    {
      'name': 'Clara Johnson',
      'phoneNumber': '+5566778899',
      'contactPhoto': 'https://picsum.photos/id/4/200/200',
      'lastMessage': 'Sure, I\'ll email you the details shortly.',
      'numberOfNewMessages': 2,
    },
    {
      'name': 'Michael Brown',
      'phoneNumber': '+4433221100',
      'contactPhoto': 'https://picsum.photos/id/5/200/200',
      'lastMessage': 'Let\'s catch up soon. Miss those old times!',
      'numberOfNewMessages': 0,
    },
    {
      'name': '',
      'phoneNumber': '+6677889900',
      'contactPhoto': 'https://picsum.photos/id/6/200/200',
      'lastMessage': 'Can you send me the report by evening?',
      'numberOfNewMessages': 4,
    },
    {
      'name': 'Emily Davis',
      'phoneNumber': '+3344556677',
      'contactPhoto': 'https://picsum.photos/id/7/200/200',
      'lastMessage': 'Thanks for the gift, I really loved it!',
      'numberOfNewMessages': 1,
    },
    {
      'name': 'Chris Wilson',
      'phoneNumber': '+7788990011',
      'contactPhoto': 'https://picsum.photos/id/8/200/200',
      'lastMessage': 'Are you available for a call this afternoon?',
      'numberOfNewMessages': 3,
    },
    {
      'name': '',
      'phoneNumber': '+9988001122',
      'contactPhoto': 'https://picsum.photos/id/9/200/200',
      'lastMessage': 'Your order has been shipped. Track your package!',
      'numberOfNewMessages': 2,
    },
  ];

  static const List<Map<String, dynamic>> channels = [
    {
      'channelName': 'John Doe',
      'channelPhoto': 'https://via.placeholder.com/150/92c952',
      'lastMessage': 'Hey, are we still meeting tomorrow? Let me know!',
      'numberOfNewMessages': 3,
    },
    {
      'channelName': 'Alice Smith',
      'channelPhoto': 'https://via.placeholder.com/150/771796',
      'lastMessage': 'Don’t forget to bring the documents.',
      'numberOfNewMessages': 1,
    },
    {
      'channelName': 'Uncle Bob',
      'channelPhoto': 'https://via.placeholder.com/150/24f355',
      'lastMessage': 'Happy birthday! Hope you have a great day!',
      'numberOfNewMessages': 0,
    },
    {
      'channelName': 'Clara Johnson',
      'channelPhoto': 'https://via.placeholder.com/150/d32776',
      'lastMessage': 'Hi, this is a reminder about your appointment.',
      'numberOfNewMessages': 5,
    },
    {
      'channelName': 'Michael Brown',
      'channelPhoto': 'https://via.placeholder.com/150/f66b97',
      'lastMessage': 'Sure, I’ll email you the details shortly.',
      'numberOfNewMessages': 2,
    },
    {
      'channelName': 'Emily Davis',
      'channelPhoto': 'https://via.placeholder.com/150/56a8c2',
      'lastMessage': 'Let’s catch up soon. Miss those old times!',
      'numberOfNewMessages': 0,
    },
    {
      'channelName': 'Chris Wilson',
      'channelPhoto': 'https://via.placeholder.com/150/b0f7cc',
      'lastMessage': 'Can you send me the report by evening?',
      'numberOfNewMessages': 4,
    },
    {
      'channelName': 'Sarah Carter',
      'channelPhoto': 'https://via.placeholder.com/150/54176f',
      'lastMessage': 'Thanks for the gift, I really loved it!',
      'numberOfNewMessages': 1,
    },
    {
      'channelName': 'Daniel Evans',
      'channelPhoto': 'https://via.placeholder.com/150/51aa97',
      'lastMessage': 'Are you available for a call this afternoon?',
      'numberOfNewMessages': 3,
    },
    {
      'channelName': 'Rachel Green',
      'channelPhoto': 'https://via.placeholder.com/150/810b14',
      'lastMessage': 'Your order has been shipped. Track your package!',
      'numberOfNewMessages': 2,
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
    const Center(
      child: Text(
        "Communities Page",
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        "Calls Page",
        style: TextStyle(fontSize: 24),
      ),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}
