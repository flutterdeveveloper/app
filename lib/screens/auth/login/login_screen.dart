import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:mersal/screens/auth/login/login_cubit.dart';
import 'package:mersal/screens/auth/login/login_state.dart';
import 'package:mersal/utils/validator.dart';
import 'package:mersal/widgets/button.dart';
import 'package:mersal/widgets/text_button.dart';
import '../../../utils/constants.dart';
import '../../../widgets/country_box.dart';
import '../../../widgets/input.dart';
import '../../../widgets/text.dart';
// import 'country_code.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body:BlocProvider(
        create: (BuildContext context) =>LoginCubit(),
        child: BlocBuilder<LoginCubit,LoginState>(
          builder: (context,state) {
            var cubit=LoginCubit.get(context);
            return  OfflineBuilder(
              connectivityBuilder: (BuildContext context, ConnectivityResult value, Widget child) {
                bool online=value!=ConnectivityResult.none;
                // if(online && cubit.countries.isEmpty){
                //   cubit.getCountries();
                //   // MainCubit.get(context).getCountries();
                // }
                return Container(width: Constant.width,height: Constant.height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/splash.png"),fit: BoxFit.fill)
                  ),
                  child:Form(key: cubit.formKey,
                    child: Stack(
                    children: [
                      Positioned(top: Constant.height*0.25,right: Constant.width*0.2,
                          child: Container(width: Constant.width*0.6,height: 160,color: Colors.white,)),

                      Column(children: [
                        SizedBox(height: Constant.height*0.03),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TxtButton(text: "skip".tr,color:Constant.purple,size:22,click: ()=>print("skip"),),
                            const SizedBox(width: 10,)
                          ],
                        ),
                        SizedBox(height: Constant.height*0.02),
                        TextWidget(text: "login".tr,color: Constant.blue,size: 35,weight: FontWeight.bold,),
                        SizedBox(height: Constant.height*0.02),

                        //**********************Phone
                        SizedBox(width: Constant.width*0.8,
                          child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                            Column(
                              children: [
                                TextWidget(text: "country".tr,color: Constant.blueLight),
                                const CountryBox(),
                              ],
                            ),
                            Column(
                              children: [
                                TextWidget(text: "phone".tr,color: Constant.blueLight),
                                Input(controller: cubit.phone,width: Constant.width*0.6,type: TextInputType.phone,
                                  validator: (val){
                                    return Validator.validatePhone(val);
                                  }),
                              ],
                            ),
                          ],),
                        ),
                        //*********************Password
                        SizedBox(height: Constant.height*0.02),
                        TextWidget(text: "pass".tr,color: Constant.blueLight),
                        Input(controller: cubit.pass,width: Constant.width*0.8,pass: true,validator: (val){
                          return Validator.validatePass(val);
                        },),

                        //*********************Forget Password
                        SizedBox(height: Constant.height*0.02),
                        TxtButton(text: "forgetPass".tr,color:Constant.purple,click: ()=>Get.toNamed("/phone")),

                        //*********************Login Button
                        SizedBox(height: Constant.height*0.02),
                        MainButton(text: "login".tr,loading:state !is LoginLoadingState,click: (){
                          cubit.login();
                        },),

                        //*********************Register Button
                        SizedBox(height: Constant.height*0.015),
                        TxtButton(text: "haven'tAccount".tr,color: Constant.blueLight,
                            click:()=>Get.toNamed("/signup"))


                      ],),
                    ],
                 ),
                  ),
                );
              },child: Center(child: TextWidget(text: "somethingWentWrong".tr,)),
            );
          }
        ),
      ),
    );;
  }
}
