import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/widgets/appbars/calls_appbar.dart';
import 'package:flutter_whatsapp/widgets/appbars/chats_appbar.dart';
import 'package:flutter_whatsapp/widgets/appbars/communities_appbar.dart';
import 'package:flutter_whatsapp/widgets/appbars/updates_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    const Center(
      child: Text(
        "Chats Page",
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        "Updates Page",
        style: TextStyle(fontSize: 24),
      ),
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
