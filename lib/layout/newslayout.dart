import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/cubit.dart';
import 'package:testt/cubit/states.dart';
import 'package:testt/layout/screens/search.dart';
import 'package:testt/modules/item.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , state) {},
        builder: (context , state)
        {
          //var cubit = NewsCubit.get(context);
          NewsCubit cubit = BlocProvider.of(context);
          //cubit.getBusinessData();
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
        },
      );
  }
}
