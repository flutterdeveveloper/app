import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mersal/utils/constants.dart';
import 'package:mersal/widgets/text.dart';
import 'package:mersal/widgets/text_button.dart';


class PolicyButton extends StatelessWidget {
  final bool acceptPolicy;
  final Function save;

  const PolicyButton({Key? key,required this.acceptPolicy,required this.save}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constant.width * 0.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: acceptPolicy,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              activeColor: Constant.purple,
              // checkColor: redColor,fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
              onChanged: (val) {
                if (val == true) {
                  termsDialog(acceptPolicy,save);
                }
              }
          ),
          TextWidget(text: "acceptPolicy".tr, color: Constant.purple),
        ],
      ),
    );
  }
}
termsDialog(bool acceptPolicy,Function save){
  // if(authController.terms.isEmpty){
  //   authController.getTerms();
  // }
  Get.defaultDialog(
    title: 'useTerms'.tr,
    titleStyle:TextStyle(color: Constant.purple),
    contentPadding: const EdgeInsets.only(bottom: 0, right: 10, left: 10, top: 5),
    content: Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(
            // constraints: BoxConstraints(minHeight: height*0.4,maxHeight: height*0.7),
            height:Constant.height*0.5,
            child: SingleChildScrollView(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(text: "Policy".tr,),
                  const SizedBox(height: 8),
                  TextWidget(text: "Terms".tr,),

                  // Html(
                  //     data: """
                  //          <div>
                  //          <p>'policy'.tr</p>
                  //          $terms
                  //          </div>
                  //         """),
                  // Align(alignment: left.isFalse?Alignment.bottomLeft:Alignment.bottomRight,
                  //   child:  TxtBtn('accept'.tr, redColor, 18,
                  //           () {
                  //         acceptPolicy.value=true;
                  //         Get.back();
                  //       }),
                  // )
                ],
              ),
            ),
          ),
          // Positioned(bottom: 10,left: left.isTrue?0:10,right: left.isTrue?10:0,
          //   // alignment: Alignment.bottomLeft,
          //   child: acceptBtn()
          // )
          Container(
            alignment: Alignment.bottomLeft,
            child: TxtButton(text: 'accept'.tr,color: Constant.blueLight,
                click: save,
          ))
        ],
      ))
  );
}