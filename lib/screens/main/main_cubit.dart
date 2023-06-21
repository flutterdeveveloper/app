import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/screens/main/main_state.dart';

import '../../helpers/http_helper.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit():super(MainInitState());
  static MainCubit get(context) => BlocProvider.of(context);
  String token="";
  List countries=[];

  void init(){
    Timer(const Duration(seconds: 5), () {
      if(token.isEmpty){
        emit(MainLoadingState());
        Timer(const Duration(seconds: 4), (){
          emit(MainLoadedState(logined: false));
        });
      }else{
        emit(MainLoadedState(logined: true));
      }
    });
    getCountries();
  }

  //***********country code
  getCountries()async{
    if(countries.isEmpty && token.isEmpty){
      emit(LoadingCountryState());
      var data=await HttpHelper.post(url: "countries");
      if(data['status']==1){
        countries=data['data'];
        emit(LoadedCountryState());
      }else{
        emit(MainErrorState());
      }
    }
  }

  void updateCountryId(int id) {
    emit(SelectedCountryState(id: id));
  }

}