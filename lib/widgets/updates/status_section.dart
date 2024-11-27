import 'package:flutter/cupertino.dart';
import 'package:flutter_whatsapp/widgets/updates/status_view.dart';

class StatusSection extends StatelessWidget {
  final List<String> statusProfilePictures;
  const StatusSection({super.key, required this.statusProfilePictures});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(
          itemBuilder: (context, index) => StatusView(
            centerImageUrl: statusProfilePictures[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 15.0,
          ),
          itemCount: statusProfilePictures.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
