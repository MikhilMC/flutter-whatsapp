import 'package:flutter/material.dart';

enum AdditionalCommunitiesMenu { settings }

class CommunitiesAppbar extends StatefulWidget {
  const CommunitiesAppbar({super.key});

  @override
  State<CommunitiesAppbar> createState() => _CommunitiesAppbarState();
}

class _CommunitiesAppbarState extends State<CommunitiesAppbar> {
  AdditionalCommunitiesMenu? selectedItem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Communities'),
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
        PopupMenuButton<AdditionalCommunitiesMenu>(
          initialValue: selectedItem,
          color: const Color.fromRGBO(19, 24, 28, 1),
          iconColor: Colors.white,
          onSelected: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          itemBuilder: (context) => <PopupMenuEntry<AdditionalCommunitiesMenu>>[
            const PopupMenuItem<AdditionalCommunitiesMenu>(
              value: AdditionalCommunitiesMenu.settings,
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
