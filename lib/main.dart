import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mersal/routes.dart';
import 'package:mersal/screens/auth/login/login_cubit.dart';
import 'package:mersal/screens/auth/login/login_screen.dart';
import 'package:mersal/screens/main/main_cubit.dart';
import 'package:mersal/screens/main/main_state.dart';
import 'package:mersal/screens/splash.dart';
import 'package:mersal/screens/welcome.dart';
import 'package:mersal/translate/language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()..init()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Languages(),
        locale: const Locale('ar', 'US'),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        home: BlocBuilder<MainCubit,MainState>(
          builder: (BuildContext context, state) {
            if(state is MainInitState){
              return const Splash();
            }else if(state is MainLoadingState){
              return const Welcome();
            }else if (state is MainLoadedState){
              return state.logined?const Welcome():const LoginScreen();
            }
            return const SizedBox(height: 0,);
        },),
        getPages: routes,
      ),
    );
  }
}
