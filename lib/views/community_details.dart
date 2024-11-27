import 'package:flutter/material.dart';

enum CommunityDetailsMenu { additionalInfo, viewMembers }

class CommunityDetails extends StatefulWidget {
  final String name;
  final String lastMessage;
  final String imageUrl;
  final List<Map<String, dynamic>> groups;

  const CommunityDetails({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.imageUrl,
    required this.groups,
  });

  @override
  State<CommunityDetails> createState() => _CommunityDetailsState();
}

class _CommunityDetailsState extends State<CommunityDetails> {
  CommunityDetailsMenu? selectedItem;

  @override
  Widget build(BuildContext context) {
    String showingLastMessage =
        "~ ${widget.lastMessage.length > 50 ? "${widget.lastMessage.substring(0, 47)}..." : widget.lastMessage}";

    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 16, 20, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color.fromRGBO(19, 24, 28, 1),
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: SizedBox(
                  height: 40.0,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.imageUrl),
                              alignment: Alignment.topCenter,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Community · ${widget.groups.length} Groups",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              PopupMenuButton<CommunityDetailsMenu>(
                initialValue: selectedItem,
                color: const Color.fromRGBO(19, 24, 28, 1),
                iconColor: Colors.white,
                onSelected: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                itemBuilder: (context) =>
                    <PopupMenuEntry<CommunityDetailsMenu>>[
                  const PopupMenuItem<CommunityDetailsMenu>(
                    value: CommunityDetailsMenu.additionalInfo,
                    child: Text(
                      'Additional Info',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const PopupMenuItem<CommunityDetailsMenu>(
                    value: CommunityDetailsMenu.viewMembers,
                    child: Text(
                      'View Members',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade900,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.campaign,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Announcements",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        showingLastMessage,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(color: Colors.grey.shade900),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Groups you can join",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.groups[index]['groupImage'].toString(),
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
                          widget.groups[index]['name'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "${widget.groups[index]['memberCount'].toString()} members",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemCount: widget.groups.length,
          )
        ],
      ),
    );
  }
}
