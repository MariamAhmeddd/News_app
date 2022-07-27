import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/cubit.dart';
import 'package:testt/cubit/states.dart';
import 'package:testt/layout/screens/search.dart';
import 'package:testt/modules/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , state) {},
        builder: (context , state)
        {
          //var cubit = NewsCubit.get(context);
          NewsCubit cubit = BlocProvider.of(context);
          cubit..getDiscovery()..getBusinessData()..getSportsData()..getScienceData()..getHealthData()..getTechnologyData();

          //mariam for test
          /*
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "News App",
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              onTap: (idx)
              {
                cubit.changeBottomNavBar(idx);
              },
              type: BottomNavigationBarType.fixed,
            ),
          );
          */

          //Sohyla

          return Scaffold(
            appBar: AppBar(
              title: Text('News App',),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      );
  }
}
