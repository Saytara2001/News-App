import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme =ThemeData(
    primarySwatch: Colors.deepOrange,
    floatingActionButtonTheme:FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange
    ),
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
      iconTheme:IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:HexColor('333739'),
        statusBarIconBrightness:Brightness.light,
      ),
      backgroundColor: HexColor('333739'),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 25,
      unselectedItemColor: Colors.grey,
      backgroundColor: HexColor('333739'),
    ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);

ThemeData lightTheme =ThemeData(
    primarySwatch: Colors.deepOrange,
    floatingActionButtonTheme:FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme:IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness:Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepOrange,
      elevation: 25,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
  ),

);