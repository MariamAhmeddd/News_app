import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/states.dart';
import 'package:testt/layout/screens/busniess.dart';
import 'package:testt/layout/screens/health.dart';
import 'package:testt/layout/screens/science.dart';
import 'package:testt/layout/screens/sports.dart';
import 'package:testt/layout/screens/technology.dart';
import 'package:testt/network/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(InitialState());

  int currentIndex = 0;

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business
        ),
      label: "Business"
    ),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.sports
        ),
        label: "Sports"
    ),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.science
        ),
        label: "Science"
    ),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.health_and_safety,
        ),
        label: "Health"
    ),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.biotech_rounded,
        ),
        label: "Technology",
    ),
  ];

  void changeBottomNavBar(int idx)
  {
    currentIndex = idx;
    if (currentIndex == 0)
    {
        getBusinessData();
    }
    if (currentIndex == 1)
    {
      getSportsData();
    }
    if (currentIndex == 2)
    {
      getScienceData();
    }
    if (currentIndex == 3)
    {
      getHealthData();
    }
    if (currentIndex == 4)
    {
      getTechnologyData();
    }
    emit(CubitBottonNav());
  }

  List<Widget> screens =
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
            'country' : 'eg',
            'category' : 'business',
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
          'country' : 'eg',
          'category' : 'science',
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
          'country' : 'eg',
          'category' : 'sport',
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
          'country' : 'eg',
          'category' : 'health',
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

    emit(GetHealthload());
    //print('hereeee5');
    if(technology.length==0)
    {
      DioHelper.getDataFromDio(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'eg',
          'category' : 'technology',
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
        'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
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


}