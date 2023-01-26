import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyReadMoreWidget extends StatefulWidget {
  final String text;

  const MyReadMoreWidget({required this.text});

  @override
  _MyReadMoreWidgetState createState() => _MyReadMoreWidgetState();
}

class _MyReadMoreWidgetState extends State<MyReadMoreWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: secondHalf.isEmpty
            ? Text(firstHalf)
            : Column(
                children: [
                  RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        text:
                            flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                        children: [
                          TextSpan(
                            style: const TextStyle(color: Colors.orange),
                            text: flag ? "Read more" : "Read less",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                          )
                        ]),
                  ),
                ],
              )
        // Column(
        //     children: <Widget>[
        //       Text(flag ? ("$firstHalf...") : (firstHalf + secondHalf)),
        //       InkWell(
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: <Widget>[
        //             Text(
        //               flag ? "show more" : "show less",
        //               style: const TextStyle(color: Colors.orange),
        //             ),
        //           ],
        //         ),
        //         onTap: () {
        //           setState(() {
        //             flag = !flag;
        //           });
        //         },
        //       ),
        //     ],
        //   ),
        );
  }
}
