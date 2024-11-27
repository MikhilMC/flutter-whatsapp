import 'package:flutter/material.dart';

class FavouriteItem extends StatelessWidget {
  final String name;
  final String contactPicture;
  const FavouriteItem({
    super.key,
    required this.name,
    required this.contactPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
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
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          child: Row(
            children: [
              Icon(
                Icons.call,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.videocam,
                color: Colors.white,
              )
            ],
          ),
        )
      ],
    );
  }
}
