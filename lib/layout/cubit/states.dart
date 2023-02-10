abstract class NewStates{}

class NewsInitialState extends NewStates {}

class NewsBottomNavState extends NewStates{}

//business states
class NewsGetBusinessLoadingState extends NewStates{}
class NewsGetBusinessSuccessState extends NewStates{}
class NewsGetBusinessErrorState extends NewStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}

//business science
class NewsGetScienceLoadingState extends NewStates{}
class NewsGetScienceSuccessState extends NewStates{}
class NewsGetScienceErrorState extends NewStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}

//business Sports
class NewsGetSportsSuccessState extends NewStates{}
class NewsGetSportsLoadingState extends NewStates{}
class NewsGetSportsErrorState extends NewStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}
//state dark mode
class NewsChangeModeState extends NewStates{}
