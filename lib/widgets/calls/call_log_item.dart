import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/views/home_page.dart';

class CallLogItem extends StatelessWidget {
  final String name;
  final int callCount;
  final String? number;
  final String date;
  final CallType type;
  final CallDirection direction;
  final bool isVideoCall;
  final String contactPicture;

  const CallLogItem({
    super.key,
    required this.name,
    required this.callCount,
    this.number,
    required this.date,
    required this.type,
    required this.direction,
    required this.isVideoCall,
    required this.contactPicture,
  });

  Color _getColor() {
    switch (type) {
      case CallType.missedCall:
        return Colors.red;
      case CallType.recieved:
        return Colors.white;
    }
  }

  Icon _getCallIcon() {
    switch (direction) {
      case CallDirection.incoming:
        return Icon(
          CupertinoIcons.arrow_down_left,
          color: type == CallType.missedCall ? Colors.red : Colors.green,
          size: 15,
        );
      case CallDirection.outgoing:
        return const Icon(
          CupertinoIcons.arrow_up_right,
          color: Colors.green,
          size: 15,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isContactSaved = number == null;

    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            contactPicture,
            scale: 1.0,
          ),
          radius: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${isContactSaved ? name : number}${callCount > 1 ? " ($callCount)" : ""}",
              style: TextStyle(
                color: _getColor(),
                fontSize: 18,
              ),
            ),
            Visibility(
              visible: !isContactSaved,
              child: Text(
                "~ $name",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              children: [
                _getCallIcon(),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
