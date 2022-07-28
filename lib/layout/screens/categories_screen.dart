import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/cubit.dart';
import 'package:testt/cubit/states.dart';
import 'package:testt/modules/item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context , state)
      {
        var list = NewsCubit.get(context).catagoriesScreens;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Categories',
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child : buildListForCatagoryScreen(list,context),
              ),
            ],
          ),
        );
      },
    );
  }
}