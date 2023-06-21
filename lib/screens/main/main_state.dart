abstract class MainState{}
class MainInitState extends MainState{}
class MainLoadingState extends MainState{}

class MainLoadedState extends MainState{
  final bool logined;
  MainLoadedState({required this.logined});
}
class LoadingCountryState extends MainState{}
class LoadedCountryState extends MainState{}
class SelectedCountryState extends MainState{
  int id;
  SelectedCountryState({required this.id});
}

class MainErrorState extends MainState{}

