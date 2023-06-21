import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mersal/helpers/http_helper.dart';
import 'package:mersal/screens/auth/login/login_state.dart';
import 'package:mersal/screens/main/main_cubit.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String countryId="";
  List countries=[];
  var phone=TextEditingController();
  var pass=TextEditingController();


  void init(){
    getCountries();
    // MainCubit.get(context).getCountries();
    
  }
  getCountries()async{
    var data=await HttpHelper.post(url: "countries");
    // !data.toString().contains("network ") &&data!=null
    if(data['status']==1){
      countries=data['data'];
    }
  }
  void updateCountryId(int id) {
    emit(SelectedCountryState(id: id));
  }
  login(){
    print("object");
    if(formKey.currentState!.validate()){

    }
  }


}