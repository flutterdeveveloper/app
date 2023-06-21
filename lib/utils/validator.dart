
// extension PhoneValidator on String{
//   bool isValidPhone(){
//     if(length<8){
//       return true;
//     }else {
//       return false;
//     }
//   }
// }
// extension NameValidator on String{
//   bool isValidName(){
//     if(length<4 || startsWith("[0-9]")){
//       return false;
//     }else {
//       return true;
//     }
//   }
// }
import 'package:get/get.dart';

class Validator{

  static validatePhone(val) {
    if (val.toString().isEmpty) {
      return "enterPhone".tr;
    } else if (val.toString().length < 8) {
      return "enterValidPhone".tr;
    }
  }
  static validateName(val) {
    if (val.toString().isEmpty) {
      return "enterName".tr;
    } else if (val.toString().length < 3 || val.toString().startsWith("[0-9]")) {
      return "enterValidName".tr;
    }
  }

  static validatePass(val) {
    if (val.toString().isEmpty) {
      return "enterPass".tr;
    } else if (val.toString().length < 6) {
      return "passNoLessThan6".tr;
    }
  }

  static validateConfirmPass(pass,confirmPass) {
    if (confirmPass.toString().isEmpty) {
      return "confirmPass".tr;
    } else if (confirmPass.toString()!=pass.toString()) {
      return "passNotMatch".tr;
    }
  }

}
