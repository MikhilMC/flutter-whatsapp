import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/widgets/communities/community_item.dart';

class Communities extends StatelessWidget {
  final List<Map<String, dynamic>> communities;
  const Communities({super.key, required this.communities});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(11, 16, 20, 1),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.groups,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 12,
                            child: Icon(
                              Icons.add,
                              // size: 10,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "New community",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 20,
            color: Colors.black,
          ),
        ),
        SliverList.separated(
          itemBuilder: (context, index) {
            return CommunityItem(
              key: Key(communities[index]['id'].toString()),
              name: communities[index]['name'].toString(),
              lastMessage: communities[index]['lastMessage'].toString(),
              imageUrl: communities[index]['imageUrl'].toString(),
              groups:
                  communities[index]['groups'] as List<Map<String, dynamic>>,
            );
          },
          separatorBuilder: (_, __) {
            return Container(
              height: 20,
              color: Colors.black,
            );
          },
          itemCount: communities.length,
        )
      ],
    );
  }
}
