import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/cubit.dart';
import 'package:testt/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
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
      ),
    );
  }
}
