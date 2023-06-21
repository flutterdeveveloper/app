import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mersal/utils/constants.dart';
import 'package:mersal/widgets/text.dart';

void toast(String text){
  Get.defaultDialog(title: "",
      titleStyle: const TextStyle(fontSize: 0),
      content: TextWidget(text:text)
  );
}
void popUp(bool done,var txt){
  Get.defaultDialog(titlePadding: EdgeInsets.zero,
      title: "",contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            done?Icon(Icons.check_circle,color:Constant.purple,size: 200):
            const CircleAvatar(backgroundColor:Colors.red,radius: 100,
                child: Icon(Icons.close,size: 100,color: Colors.white,)),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(style: TextStyle(color:Constant.black,fontSize: 22,
                  fontWeight: FontWeight.bold),text: txt), textAlign: TextAlign.center,),
            const SizedBox(height: 10),
          ],
        ),
      )
  );
}