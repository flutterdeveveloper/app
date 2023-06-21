import 'package:get/get.dart';
import 'package:mersal/screens/auth/login/login_screen.dart';
import 'package:mersal/screens/splash.dart';
import 'package:mersal/screens/welcome.dart';
var routes=[
  GetPage(name: "/splash", page: ()=>const Splash()),
  GetPage(name: "/welcome", page: ()=>const Welcome()),
  GetPage(name: "/login", page: ()=>const LoginScreen()),
];