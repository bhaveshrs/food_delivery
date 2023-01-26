import 'package:flutter/material.dart';
import 'package:food_delivery/screens/favorite_screen.dart';
import 'package:food_delivery/screens/food_info_screen.dart';
import 'package:food_delivery/widgets/favourite_menu_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/popular_food_widget.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with SingleTickerProviderStateMixin {
  int currentpage = 1;
  final _pagecontroller = PageController(initialPage: 1);
  final TextEditingController _controller = TextEditingController();
  List myicons = [
    Icons.restaurant,
    Icons.restaurant_menu_sharp,
    Icons.local_pizza_outlined,
    Icons.rice_bowl,
    Icons.restaurant_menu_sharp,
    Icons.local_pizza_outlined,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topRight,
                colors: [Colors.white, Color(0xfffcdbc9)])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dilivery to',
                    style: GoogleFonts.oxygen(
                        color: Colors.grey, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xfffe97f4a),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Sukambi indinesia',
                        style: GoogleFonts.oxygen(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Center(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 17,
                          color: Color(0xfffe97f4a),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIconColor: Colors.orange,
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "what did you eat today?",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.white60),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelStyle: GoogleFonts.oxygen(
                          fontSize: 15.0, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                    height: 130,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return dotContainer(index, context);
                      },
                    )),
                Flexible(
                  child: PageView.builder(
                      controller: _pagecontroller,
                      onPageChanged: (int index) {
                        currentpage = index;
                        _notify();
                      },
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Popular Food',
                                        style: GoogleFonts.oxygen(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Text(
                                      'see all',
                                      style: GoogleFonts.oxygen(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const AdtoCartPage(),
                                          ));
                                        },
                                        child: const PopularFoodWidget());
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Favourite menu',
                                        style: GoogleFonts.oxygen(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const FavoriteFoodPage(),
                                        ));
                                      },
                                      child: Text(
                                        'see all',
                                        style: GoogleFonts.oxygen(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 130,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const AdtoCartPage(),
                                          ));
                                        },
                                        child: const FavouriteWidget());
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  GestureDetector dotContainer(int i, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (i == 0) {
          _pagecontroller.jumpToPage(0);
        } else if (i == 1) {
          _pagecontroller.jumpToPage(1);
        } else if (i == 2) {
          _pagecontroller.jumpToPage(2);
        } else if (i == 3) {
          _pagecontroller.jumpToPage(3);
        } else if (i == 4) {
          _pagecontroller.jumpToPage(4);
        }
        // _pagecontroller.previousPage(
        //     duration: const Duration(milliseconds: 10),
        //     curve: Curves.linear);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              // margin: const EdgeInsets.all(),
              height: 80,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentpage == i ? Colors.orange : Colors.white),
              child: const Icon(Icons.local_pizza_sharp),
            ),
            Text(
              'pizza',
              style: GoogleFonts.oxygen(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  _notify() {
    if (mounted) {
      setState(() {});
    }
  }
}
