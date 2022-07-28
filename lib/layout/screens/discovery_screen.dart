

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/cubit.dart';
import 'package:testt/cubit/states.dart';
import 'package:testt/modules/item.dart';

class DiscoveryScreen extends StatelessWidget {
  // ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).discovery;
        var size = list.length;
        if(size > 0)
        {
          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! NewsGetDiscoveryLoadingState,
              builder: (context)=> ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildArticleItem(context,list[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 2,),
                  itemCount: 10
              ),
              fallback: (context)=> Center(child: CircularProgressIndicator()),
            ),
          );
        }
        else
        {
          return Container(
              child: Center(child: Text('Data Is Loading')));
        }
      },
    );
  }
}
