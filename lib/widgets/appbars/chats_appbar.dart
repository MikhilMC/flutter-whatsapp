import 'package:flutter/material.dart';

enum AdditionalChatMenu {
  newGroup,
  newBroadcast,
  linkedDevices,
  starredMessages,
  payments,
  settings
}

class ChatsAppbar extends StatefulWidget {
  const ChatsAppbar({super.key});

  @override
  State<ChatsAppbar> createState() => _ChatsAppbarState();
}

class _ChatsAppbarState extends State<ChatsAppbar> {
  AdditionalChatMenu? selectedItem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Whatsapp'),
      backgroundColor: const Color.fromRGBO(11, 16, 20, 1),
      actions: [
        const Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        PopupMenuButton<AdditionalChatMenu>(
          initialValue: selectedItem,
          color: const Color.fromRGBO(19, 24, 28, 1),
          iconColor: Colors.white,
          onSelected: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          itemBuilder: (context) => <PopupMenuEntry<AdditionalChatMenu>>[
            const PopupMenuItem<AdditionalChatMenu>(
              value: AdditionalChatMenu.newGroup,
              child: Text(
                'New Group',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem<AdditionalChatMenu>(
              value: AdditionalChatMenu.newBroadcast,
              child: Text(
                'New Broadcast',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem<AdditionalChatMenu>(
              value: AdditionalChatMenu.linkedDevices,
              child: Text(
                'Linked Devices',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem<AdditionalChatMenu>(
              value: AdditionalChatMenu.starredMessages,
              child: Text(
                'Starred Messages',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem<AdditionalChatMenu>(
              value: AdditionalChatMenu.payments,
              child: Text(
                'Payments',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem<AdditionalChatMenu>(
              value: AdditionalChatMenu.settings,
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.white,
      ),
    );
  }
}
