import 'package:flutter/material.dart';
import 'package:mersal/widgets/text.dart';
class TxtButton extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final Function click;
  const TxtButton({Key? key,required this.text,this.size,this.color,this.weight,required this.click}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      click();
    },
      child: TextWidget(text: text,color: color,size: size,weight: weight,),);
  }
}
