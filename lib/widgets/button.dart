import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mersal/utils/constants.dart';
import 'package:mersal/widgets/text.dart';
class MainButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;
  final bool? loading;
  final Function? click;
  const MainButton({Key? key,required this.text,this.color,this.width,this.height,this.radius,this.loading,this.click}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(loading==false){
          click!();
        }
      },
      child: Container(width: width??Constant.width*0.5,
        height: height??45,
        decoration: BoxDecoration(
          color: color??Constant.purple,
          borderRadius: BorderRadius.circular(radius??20),
        ),
        child: Center(child: TextWidget(text: loading==true?"loading".tr:text,color: Colors.white,size: 22)),
      ),
    );
  }
}
