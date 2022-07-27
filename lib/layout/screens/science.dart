
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/cubit/cubit.dart';
import 'package:testt/cubit/states.dart';
import 'package:testt/modules/item.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      (
      listener: (context, state) {},
      builder: (context, state) {
        //NewsCubit.get(context).getBusinessData();
        var list =  NewsCubit.get(context).science;
        var size = list.length;
        //print(list.length);
        if(size > 0)
          {
            return
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Science',
                  ),
                ),
                body: ConditionalBuilder(
                  fallback: (context) => Center(child: Text('this is not true')),
                  condition: state is! GetScienceload,
                  builder: (context) => /*ListView.separated(
            itemBuilder: (context,index) => buildItem(),
            separatorBuilder:  (context, index) => myDivider(),
            itemCount: 10),*/
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 1500,

                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      //aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => buildItem(list[itemIndex],context),
                  ),
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
