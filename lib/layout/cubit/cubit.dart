import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/layout/modules/business/business_screen.dart';
import 'package:news_app/layout/modules/science/science_screen.dart';
import 'package:news_app/layout/modules/setting_screen/setting_screen.dart';
import 'package:news_app/layout/modules/sports/sports_screen.dart';
import 'package:news_app/layout/network/dio_helper.dart';
import 'package:news_app/layout/network/shared_prefreneces.dart';

class NewsCubit extends Cubit<NewStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  //bottom Navigation
  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(), /*SettingScreen()*/
  ];
  List<BottomNavigationBarItem> buttonItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  void changeButton(int index) {
    currentIndex = index;
    if (index == 1)
      getScience();
    else if (index == 2) getSports();
    emit(NewsBottomNavState());
  }

  //get data from api
  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];

  void getBusiness() {
    if (business.length == 0) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '857f679b770b4ee18bb2b22d4bf00dc5',
      }).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetBusinessErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  void getScience() {
    if (science.length == 0) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '857f679b770b4ee18bb2b22d4bf00dc5',
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetScienceErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSports() {
    if (sports.length == 0) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '857f679b770b4ee18bb2b22d4bf00dc5',
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSportsErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  //Dark Mode
  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(NewsChangeModeState());
    });
  }
}
