import 'package:flutter/material.dart';
import 'package:mersal/utils/constants.dart';
class Input extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final bool? pass;
  final TextInputType? type;
  final double? width;
  final int? length;
  final Function? validator;
  const Input({Key? key,this.hint,required this.controller,this.pass,this.type,this.width,this.length,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border=UnderlineInputBorder(borderSide: BorderSide(width: 4, color: Constant.light));
   //when validating field its size changed and my design changed how t prevent that
    return Transform.scale(scaleY: 0.8,
      child: SizedBox(height: 40,width:width??Constant.width*0.8,
          child: TextFormField(
            controller: controller,obscureText: pass??false,
            validator: (value) {
              if(validator!=null){
                return validator!(value);
              }
              return null;
            },
            keyboardType: type??TextInputType.text,
            textAlign: TextAlign.center,
            style:TextStyle(color: Constant.black,fontSize: 20, fontFamily:"font",fontWeight: FontWeight.w500 ),
            decoration: InputDecoration(
                hintText: hint,border: border,counterText: "",
                enabledBorder: border, focusedBorder: border
            ),
            maxLength: length??500,
            textInputAction: TextInputAction.next,
          )
      ),
    );
  }

}

