import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/cubit.dart';
import 'package:testt/cubit/states.dart';
import 'package:testt/layout/newslayout.dart';
import 'package:testt/network/dio_helper.dart';

// GET
// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// query : country=eg&category=business&apiKey=84d9bfdd09d94514ab491388a3e520e4
// apiKey = bdb4c206eb8c49e7bd6fd024b8b30db3 ((sohyla))

void main() {

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create : (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , state) {},
        builder: (context , state) {

          //mariam for test
          /*
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
            ),
            home: NewsLayout(),
          );
          */

          //Sohyla

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /*textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.blue,
                ),
                bodyText2: TextStyle(
                  color: Colors.blue,
                )
              ),*/
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 20.0,
              ),
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}