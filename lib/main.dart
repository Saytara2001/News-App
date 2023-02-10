import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/component/bloc_observer.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/layout/network/dio_helper.dart';
import 'package:news_app/layout/network/shared_prefreneces.dart';
import 'package:news_app/layout/news_layout.dart';

import 'layout/component/theme.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  //listen to app
   Bloc.observer = MyBlocObserver();
  //to create dio
  DioHelper.init();
  //to save light
   await CacheHelper.init();
   bool? dark = CacheHelper.getboolean(key: 'isDark')??false;
  runApp(NewsApp(dark));
}
class NewsApp extends StatelessWidget {
  final bool? isDark;
  NewsApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness()..changeAppMode(
        fromShared: isDark,
      ),
      child: BlocConsumer<NewsCubit,NewStates>(
        listener:(context,state){} ,
        builder:(context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:NewsCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
