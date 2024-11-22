import 'package:flutter/material.dart';

enum AdditionalCallesMenu { clearCallLog, settings }

class CallsAppbar extends StatefulWidget {
  const CallsAppbar({super.key});

  @override
  State<CallsAppbar> createState() => _CallsAppbarState();
}

class _CallsAppbarState extends State<CallsAppbar> {
  AdditionalCallesMenu? selectedItem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Calls'),
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
        PopupMenuButton<AdditionalCallesMenu>(
          initialValue: selectedItem,
          color: const Color.fromRGBO(19, 24, 28, 1),
          iconColor: Colors.white,
          onSelected: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          itemBuilder: (context) => <PopupMenuEntry<AdditionalCallesMenu>>[
            const PopupMenuItem<AdditionalCallesMenu>(
              value: AdditionalCallesMenu.clearCallLog,
              child: Text(
                'Clear Call Log',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem<AdditionalCallesMenu>(
              value: AdditionalCallesMenu.settings,
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
