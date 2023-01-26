import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/readmore_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AdtoCartPage extends StatefulWidget {
  const AdtoCartPage({super.key});

  @override
  State<AdtoCartPage> createState() => _AdtoCartPageState();
}

class _AdtoCartPageState extends State<AdtoCartPage> {
  final reader = ValueNotifier<int>(0);
  bool heart = false;
  bool size = false;
  final images = [
    'assets/images/bowl1.png',
    'assets/images/bowl1.png',
    'assets/images/bowl1.png'
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    height: 300.0,
                    onPageChanged: (value, r) {
                      reader.value = value;
                    },
                  ),
                  items: images.map(
                    (i) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(i),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 10,
                    child: ValueListenableBuilder(
                      valueListenable: reader,
                      builder: (context, value, child) => ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == reader.value
                                ? Colors.yellow.shade800
                                : Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                        itemCount: images.length,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        '2km',
                        style: GoogleFonts.oxygen(
                            fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '10 min dilivery',
                        style: GoogleFonts.oxygen(
                            fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Salad with shirata',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              heart = !heart;
                            });
                          },
                          child: Icon(
                            heart
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: Colors.pink,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.0 Rating',
                        style: GoogleFonts.oxygen(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    'Discription',
                    style: GoogleFonts.oxygen(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: MyReadMoreWidget(text: "data" * 120),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'size',
                          style: GoogleFonts.oxygen(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            size = !size;
                          });
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              color: size == false
                                  ? Colors.grey.shade300
                                  : Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.rice_bowl_sharp),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Normal',
                                    style: GoogleFonts.oxygen(),
                                  )
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            size = !size;
                          });
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              color: size == true
                                  ? Colors.grey.shade300
                                  : Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.rice_bowl_sharp),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Large',
                                    style: GoogleFonts.oxygen(),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("price"),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Rp 40.500',
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    )),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.orange)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.minus,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '1',
                      style: GoogleFonts.oxygen(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.orange)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      'Add To Cart',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oxygen(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
