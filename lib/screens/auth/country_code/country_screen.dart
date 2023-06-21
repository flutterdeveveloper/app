import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mersal/screens/main/main_cubit.dart';
import 'package:mersal/screens/main/main_state.dart';
import 'package:mersal/utils/constants.dart';
import 'package:mersal/widgets/text.dart';

class CountryBox extends StatelessWidget {
  const CountryBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // List countries=MainCubit.get(context).countries;
    return GestureDetector(onTap: (){
      print("object");
      showCountries(context);
    },
      child: SizedBox(width: Constant.width*0.15,
        child: Column(children: [
          const SizedBox(height: 30,),
          // countries.isEmpty?const SizedBox(height: 30,):
          // Image.network("${Constant.imgUrl}${countries[0]['logo']}",width: Constant.width*0.12,height: 30,),
          Container(width: Constant.width*0.15,height: 3,color: Constant.light,)
        ],),
      ),
    );
  }
}
void showCountries(BuildContext context){
  Get.defaultDialog(
    title: "chooseYourCountry".tr,
    titleStyle: TextStyle(color: Constant.blueLight),
    content:  BlocBuilder<MainCubit,MainState>(
        builder: (context,state) {
          var cubit=MainCubit.get(context);
          if(state is LoadingCountryState){
            return Center(child: TextWidget(text: "loading".tr,),);
          }else if(state is MainErrorState){
            return Center(child: TextWidget(text: "somethingWentWrong".tr,),);
          }
          // else if(state is LoadedCountryState){
          return SizedBox(height: Constant.height*0.5,
            child: ListView.builder(
                itemCount: cubit.countries.length,
                itemBuilder: (context,i){
                  return ListTile(
                    leading:  Image.network("${Constant.imgUrl}${cubit.countries[i]['logo']}",width: Constant.width*0.12,height: 30,),
                    title: TextWidget(text: cubit.countries[i]['name'],),
                    trailing: TextWidget(text: "+${cubit.countries[i]['code']}",),
                    onTap:(){
                      MainCubit.get(context).updateCountryId(cubit.countries[i]['id']);
                    } ,
                  );
                }),
          );
        }
      // }
    ),
  );
}