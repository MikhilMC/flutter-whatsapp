import 'package:flutter/material.dart';

enum AdditionalUpdatesMenu { statusPrivacy, createChannel, settings }

class UpdatesAppbar extends StatefulWidget {
  const UpdatesAppbar({super.key});

  @override
  State<UpdatesAppbar> createState() => _UpdatesAppbarState();
}

class _UpdatesAppbarState extends State<UpdatesAppbar> {
  AdditionalUpdatesMenu? selectedItem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Updates'),
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
        const Icon(
          Icons.search_outlined,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        PopupMenuButton<AdditionalUpdatesMenu>(
          initialValue: selectedItem,
          color: const Color.fromRGBO(19, 24, 28, 1),
          iconColor: Colors.white,
          onSelected: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          itemBuilder: (context) => <PopupMenuEntry<AdditionalUpdatesMenu>>[
            const PopupMenuItem<AdditionalUpdatesMenu>(
              value: AdditionalUpdatesMenu.statusPrivacy,
              child: Text(
                'Status Privacy',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem<AdditionalUpdatesMenu>(
              value: AdditionalUpdatesMenu.createChannel,
              child: Text(
                'Create Channel',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem<AdditionalUpdatesMenu>(
              value: AdditionalUpdatesMenu.settings,
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
        fontSize: 25,
        color: Colors.white,
      ),
    );
  }
}
