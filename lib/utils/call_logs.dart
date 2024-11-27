import 'dart:math';

import 'package:flutter_whatsapp/views/home_page.dart';

class CallLogs {
  static const List<Map<String, dynamic>> _contactNames = [
    {"name": "Ociuz Academy", "isSaved": true},
    {"name": "Aneena Ramakrishnan", "isSaved": false},
    {"name": "Sai Blockchain Boutique", "isSaved": true},
    {"name": "Faizal [GEC-IT]", "isSaved": true},
    {"name": "24*7 USDT", "isSaved": false},
    {"name": "Vinil", "isSaved": true},
  ];

  static const List<CallType> callTypes = CallType.values;
  static const List<CallDirection> callDirections = CallDirection.values;

  static String generatePhoneNumber() {
    List<String> prefixes = ["9", "8", "7", "6"];
    String areaCode =
        "${prefixes[Random().nextInt(4)]}${Random().nextInt(90) + 10}"; // Generates a 3-digit area code
    String part1 =
        "${Random().nextInt(900) + 100}"; // Generates the next 3 digits
    String part2 =
        "${Random().nextInt(9000) + 1000}"; // Generates the last 4 digits
    return "+91 $areaCode-$part1-$part2";
  }

  static final List<Map<String, String?>> _contacts = List.generate(
    _contactNames.length,
    (index) {
      return {
        "name": _contactNames[index]['name'].toString(),
        "phone": _contactNames[index]['isSaved'] ? null : generatePhoneNumber(),
        "contactPicture": "https://picsum.photos/200/300?random=${index + 1}",
      };
    },
  );

  static List<Map<String, dynamic>> generateCallLog() {
    return List.generate(20, (index) {
      final random = Random();

      final int selectedIndex = random.nextInt(_contacts.length);
      final CallType selectedCallType =
          callTypes[random.nextInt(callTypes.length)];
      final CallDirection selectedCallDirection =
          selectedCallType == CallType.missedCall
              ? CallDirection.incoming
              : callDirections[random.nextInt(callDirections.length)];

      return {
        "name": _contacts[selectedIndex]['name'],
        "callCount": random.nextInt(5) + 1,
        "number": _contacts[selectedIndex]['phone'],
        "date":
            "${random.nextInt(30) + 1} November, ${random.nextInt(12) + 1}:${random.nextInt(60).toString().padLeft(2, '0')} ${random.nextBool() ? "am" : "pm"}",
        "type": selectedCallType,
        "direction": selectedCallDirection,
        "isVideoCall": random.nextBool(),
        "contactPicture": _contacts[selectedIndex]['contactPicture'],
      };
    });
  }
}
