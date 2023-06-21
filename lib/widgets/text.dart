import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  const TextWidget({Key? key,required this.text,this.size,this.color,this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color??Colors.black,fontSize: size??18,
        fontWeight: weight??FontWeight.w500,fontFamily: "font"),);
  }
}
