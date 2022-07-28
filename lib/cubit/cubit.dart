import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/states.dart';
import 'package:testt/layout/newslayout.dart';
import 'package:testt/layout/screens/categories_screen.dart';
import 'package:testt/layout/screens/discovery_screen.dart';
import 'package:testt/layout/screens/health.dart';
import 'package:testt/layout/screens/busniess.dart';
import 'package:testt/layout/screens/science.dart';
import 'package:testt/modules/item.dart';
import 'package:testt/network/dio_helper.dart';
import 'package:testt/layout/screens/technology.dart';
import 'package:testt/layout/screens/search.dart';
import 'package:testt/layout/screens/sports.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  int currentIndex = 0;

  static NewsCubit get(context) => BlocProvider.of(context);


  bool isDark = false;

  void ChangeMode()
  {
    isDark = !isDark;
    emit(CubitModeState());
  }

  // screens of catagories

  List<Widget> catagoriesScreens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    HealthScreen(),
    TechnologyScreen(),
  ];


  List<dynamic>business = [];
  List<dynamic>science = [];
  List<dynamic>sports = [];
  List<dynamic>health = [];
  List<dynamic>technology = [];
  List<dynamic>search = [];

  void getBusinessData()
  {

    emit(GetBusinessload());
    //print('hereeee');
    if(business.length==0)
      {
        DioHelper.getDataFromDio(
          url: 'v2/top-headlines',
          query:
          {
            'country' : 'us',
            'category' : 'business',
            //'apiKey' : '84d9bfdd09d94514ab491388a3e520e4'
            //'apiKey' : '09ced2520beb4a09975d993933e45350'
            //'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
            //'apiKey' : 'bed8563ef8494d6684bec7083ec62295',
            //'apiKey' : '90e7eea65b9a465582a11ac7fe4864de',
            //'apiKey' : '4088f5df7aaa4fd1be731ad236058a2a',
            'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
          },
        ).then((value)
        {
          business = value.data['articles'];
          //print(business);
          emit(GetBusinessSuccess());
        }
        ).catchError((onError)
        {
          emit(GetBusinessfail());
          print(onError.toString());
        }
        );
      }
    else{
      emit(GetBusinessSuccess());
    }
  }

  void getScienceData()
  {

    emit(GetScienceload());
    //print('hereeee2');
    if(science.length==0)
    {
      DioHelper.getDataFromDio(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'us',
          'category' : 'science',
          //'apiKey' : '84d9bfdd09d94514ab491388a3e520e4'
          //'apiKey' : '09ced2520beb4a09975d993933e45350'
          //'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
          //'apiKey' : 'bed8563ef8494d6684bec7083ec62295',
          //'apiKey' : '4088f5df7aaa4fd1be731ad236058a2a',
          'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
        },
      ).then((value)
      {
        science = value.data['articles'];
        //print(science);
        emit(GetScienceSuccess());
      }
      ).catchError((onError)
      {
        emit(GetSciencefail());
        print(onError.toString());
      }
      );
    }
    else{
      emit(GetScienceSuccess());
    }
  }

  void getSportsData()
  {

    emit(GetSportsload());
    //print('hereeee3');
    if(sports.length==0)
    {
      DioHelper.getDataFromDio(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'us',
          'category' : 'sport',
          //'apiKey' : '84d9bfdd09d94514ab491388a3e520e4'
          //'apiKey' : '09ced2520beb4a09975d993933e45350'
          //'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
          //'apiKey' : 'bed8563ef8494d6684bec7083ec62295',
          //'apiKey' : '90e7eea65b9a465582a11ac7fe4864de',
          //'apiKey' : '4088f5df7aaa4fd1be731ad236058a2a',
          'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
        },
      ).then((value)
      {
        sports = value.data['articles'];
        //print(sports);
        emit(GetSportsSuccess());
      }
      ).catchError((onError)
      {
        emit(GetSportsfail());
        print(onError.toString());
      }
      );
    }
    else{
      emit(GetSportsSuccess());
    }
  }

  void getHealthData()
  {

    emit(GetHealthload());
    //print('hereeee4');
    if(health.length==0)
    {
      DioHelper.getDataFromDio(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'us',
          'category' : 'health',
          //'apiKey' : '84d9bfdd09d94514ab491388a3e520e4'
          //'apiKey' : '09ced2520beb4a09975d993933e45350'
          //'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
          // 'apiKey' : 'bed8563ef8494d6684bec7083ec62295',
          //'apiKey' : '90e7eea65b9a465582a11ac7fe4864de',
          //'apiKey' : '4088f5df7aaa4fd1be731ad236058a2a',
          'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
        },
      ).then((value)
      {
        health = value.data['articles'];
        //print(health);
        emit(GetHealthSuccess());
      }
      ).catchError((onError)
      {
        emit(GetHealthfail());
        print(onError.toString());
      }
      );
    }
    else{
      emit(GetHealthSuccess());
    }
  }

  void getTechnologyData()
  {

    emit(GetTechnologyload());
    //print('hereeee5');
    if(technology.length==0)
    {
      DioHelper.getDataFromDio(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'us',
          'category' : 'technology',
          //'apiKey' : '84d9bfdd09d94514ab491388a3e520e4'
          //'apiKey' : '09ced2520beb4a09975d993933e45350'
          //'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
          //'apiKey' : 'bed8563ef8494d6684bec7083ec62295',
          //'apiKey' : '90e7eea65b9a465582a11ac7fe4864de',
          //'apiKey' : '4088f5df7aaa4fd1be731ad236058a2a',
          'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
        },
      ).then((value)
      {
        technology = value.data['articles'];
        //print(technology);
        emit(GetTechnologySuccess());
      }
      ).catchError((onError)
      {
        emit(GetTechnologyfail());
        print(onError.toString());
      }
      );
    }
    else{
      emit(GetTechnologySuccess());
    }
  }

  void getSearch(String val)
  {
    emit(GetSearchload());
    DioHelper.getDataFromDio(
      url: 'v2/everything',
      query:
      {
        'q' : '$val',
        //'apiKey' : '84d9bfdd09d94514ab491388a3e520e4'
        //'apiKey' : '09ced2520beb4a09975d993933e45350'
        //'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
        //'apiKey' : 'bed8563ef8494d6684bec7083ec62295',
       // 'apiKey' : '90e7eea65b9a465582a11ac7fe4864de',
       // 'apiKey' : '4088f5df7aaa4fd1be731ad236058a2a',
        'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
      }
    ).then((value)
        {
          search=value.data['articles'];
          emit(GetSearchSuccess());
        }
    ).catchError((onError){
      emit(GetSearchfail());
      print(onError.toString());
    });
  }


  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
          Icons.web_rounded
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.apps_rounded
      ),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.search
      ),
      label: 'Search',
    ),

  ];

  List<Widget> screens =
  [
    DiscoveryScreen(),
    CategoriesScreen(),
    SearchScreen(),

  ];

  void changeBottomNavBar(int index,context)
  {
    currentIndex = index;

    if (currentIndex == 0)
    {
      navigateTo(context,HomePage());
    }

    if (currentIndex == 1)
    {
      navigateTo(context,CategoriesScreen());
    }

    if (currentIndex == 2)
    {
      navigateTo(context,SearchScreen());
    }


    emit(NewsBottomState());
  }

  List<dynamic> discovery = [];

  void getDiscovery()
  {
    emit(NewsGetDiscoveryLoadingState());
    if(discovery.length == 0)
    {
      DioHelper.getDataFromDio(
        url: 'v2/everything',
        query:
        {
          'domains' : 'wsj.com',
          //'apiKey' : '84d9bfdd09d94514ab491388a3e520e4'
          //'apiKey' : '09ced2520beb4a09975d993933e45350'
          //'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3'
          //'apiKey' : 'bed8563ef8494d6684bec7083ec62295',
          //'apiKey' : '90e7eea65b9a465582a11ac7fe4864de',
         // 'apiKey' : '4088f5df7aaa4fd1be731ad236058a2a',
          'apiKey' : 'bdb4c206eb8c49e7bd6fd024b8b30db3',
        },
      ).then((value)
      {
        discovery = value.data['articles'];
        emit(NewsGetDiscoverySuccessState());
      }).catchError((error)
      {
        //print(error.toString());
        emit(NewsGetDiscoveryErrorState(error.toString()));
      });
    }
    else
    {
      emit(NewsGetDiscoverySuccessState());
    }
  }

}