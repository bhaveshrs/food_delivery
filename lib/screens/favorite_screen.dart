import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteFoodPage extends StatefulWidget {
  const FavoriteFoodPage({super.key});

  @override
  State<FavoriteFoodPage> createState() => _FavoriteFoodPageState();
}

class _FavoriteFoodPageState extends State<FavoriteFoodPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  _notify(void Function() func) {
    if (mounted) {
      setState(() {
        func();
      });
    }
  }

  List f = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "elevent"
  ];
  List s = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "elevent"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topRight,
                colors: [Colors.white, Color(0xfffcdbc9)])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Favorite Food",
                      style: GoogleFonts.oxygen(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              TabBar(
                tabs: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Menu",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Restaurant",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
                controller: tabController,
                indicatorColor: Colors.orange,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    ListView.separated(
                      itemCount: f.length,
                      itemBuilder: (context, index) => Slidable(
                        key: ValueKey(index),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                _notify(() {
                                  f.removeAt(index);
                                });
                              },
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.grey.withOpacity(0.01),
                              foregroundColor: Colors.brown,
                              icon: CupertinoIcons.trash_circle_fill,
                            ),
                          ],
                        ),
                        child: CustomTile(title: f[index]),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: s.length,
                      itemBuilder: (context, index) => Slidable(
                        key: ValueKey(index),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                if (s[index] != null) {
                                  _notify(() {
                                    s.removeAt(index);
                                  });
                                }
                              },
                              backgroundColor: Colors.grey.withOpacity(0.01),
                              foregroundColor: Colors.brown,
                              icon: CupertinoIcons.trash_circle_fill,
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                        child: CustomTile(title: s[index]),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTile extends StatefulWidget {
  const CustomTile({super.key, required this.title});
  final String title;

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  offset: Offset(1.0, 1),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
                    ),
                  ),
                ),
                height: 70,
                width: 70,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Mancurian Rice ${widget.title}",
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, color: Colors.black),
                    maxLines: 1,
                  ),
                  const Text(
                    "Restaurant Engkong",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis, color: Colors.black),
                    maxLines: 1,
                  ),
                  const Text(
                    "Rp 50,000",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis, color: Colors.black),
                    maxLines: 1,
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            height: 20,
            width: 60,
            child: const Text(
              "50% OFF",
              style: TextStyle(color: Colors.white, fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
