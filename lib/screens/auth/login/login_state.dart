abstract class LoginState{}
class LoginInitState extends LoginState{}
class LoadingCountryState extends LoginState{}
class LoadedCountryState extends LoginState{}
class SelectedCountryState extends LoginState{
  int id;
  SelectedCountryState({required this.id});
}
class LoginLoadingState extends LoginState{}
class LoginErrorState extends LoginState{
  String error;
  LoginErrorState({required this.error});
}
class LoginDoneState extends LoginState{}