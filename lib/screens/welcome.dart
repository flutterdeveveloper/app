import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mersal/utils/constants.dart';
import 'package:mersal/widgets/text.dart';
class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: Constant.width,height: Constant.height,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/splash.png"),fit: BoxFit.fill)
        ),
        child: Stack(
          children: [
            Positioned(top: Constant.height*0.25,right: Constant.width*0.2,
                child: Container(width: Constant.width*0.6,height: 160,color: Colors.white,)),
            Column(children: [
              SizedBox(height: Constant.height*0.18,),
              TextWidget(text: "welcome".tr,color: Constant.blue,size: 35,weight: FontWeight.bold,),
              SizedBox(height: Constant.height*0.05,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(child: TextWidget(text: "askForOrder".tr,color: Constant.purple,size: 28,weight: FontWeight.bold,)),
              ),
            ],),
          ],
        ),
      ),
    );
  }
}
