import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/views/home_page.dart';
import 'package:flutter_whatsapp/widgets/calls/call_log_item.dart';
import 'package:flutter_whatsapp/widgets/calls/favourite_item.dart';

class Calls extends StatelessWidget {
  final List<Map<String, dynamic>> callLogs;
  final List<Map<String, String>> favourites;

  const Calls({
    super.key,
    required this.callLogs,
    required this.favourites,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Text(
              "Favourites",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return FavouriteItem(
                name: favourites[index]['name'].toString(),
                contactPicture: favourites[index]['contactPicture'].toString(),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 10,
            ),
            itemCount: favourites.length,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              "Recent",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return CallLogItem(
                name: callLogs[index]['name'].toString(),
                number: callLogs[index]['number'],
                callCount: int.parse(callLogs[index]['callCount'].toString()),
                date: callLogs[index]['date'].toString(),
                type: callLogs[index]['type'] as CallType,
                direction: callLogs[index]['direction'] as CallDirection,
                isVideoCall:
                    bool.parse(callLogs[index]['isVideoCall'].toString()),
                contactPicture: callLogs[index]['contactPicture'].toString(),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 10,
            ),
            itemCount: callLogs.length,
          ),
          const SliverToBoxAdapter(
            child: Divider(color: Colors.grey),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock_outlined,
                      color: Colors.grey,
                      size: 9,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Your personal calls are ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          TextSpan(
                            text: "end-to-end encrypted",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
