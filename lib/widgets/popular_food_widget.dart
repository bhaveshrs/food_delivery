import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularFoodWidget extends StatelessWidget {
  const PopularFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 300,
      width: 200,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.centerRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            // margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1), // shadow direction: bottom right
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            height: 210,
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Salad with shirata',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
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
                        '4.5',
                        style: GoogleFonts.oxygen(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        '1km',
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
                )
              ],
            ),
          ),
          Positioned(
            right: 15,
            // left: 20,
            // bottom: -10,
            top: -1,
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bowl1.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 90,
            right: 20,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Center(
                  child: Text(
                '14k',
                style: GoogleFonts.oxygen(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
