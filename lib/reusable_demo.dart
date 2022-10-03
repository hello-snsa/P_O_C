import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyReusable extends StatefulWidget {
  MyReusable({
    Key? key,
    this.greet,
    this.pic,
    this.abc,
    this.picUrl = 'https://picsum.photos/250?image=9',
    this.childOne,
    this.myFunction,
  }) : super(key: key);
  final String? greet;
  late String? abc;
  final String picUrl;
  final ImageProvider? pic;
  final Widget? childOne;
  void Function()? myFunction;

  @override
  State<MyReusable> createState() => _MyReusableState();
}

class _MyReusableState extends State<MyReusable> {
  @override
  Widget build(BuildContext context) {
    print("abc ${widget.abc}");
    return Column(
      children: [
        Text(widget.greet!),
        GestureDetector(
          onTap: widget.myFunction,
          child: Image(
            image: NetworkImage(
              widget.picUrl,
            ),
          ),
        ),
        Container(
          child: widget.childOne,
        ),
        GestureDetector(
          onTap: () => setState(() {
            widget.abc = "xyz";
          }),
          child: Container(
            width: 100.0,
            height: 50.0,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
