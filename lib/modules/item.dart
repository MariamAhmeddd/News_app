//import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testt/layout/screens/details.dart';

Widget buildItem(artical,context)
{
  return
    //padding: const EdgeInsets.all(0.0),
     InkWell(
       onTap: (){
         // pic , title ,detail , date
         navigateTo(context, details('${artical['urlToImage']}', '${artical['title']}','${artical['description']}','${artical['publishedAt']}'));
       },
       child: Center(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('${artical['urlToImage']}'),
                    //image: NetworkImage('https://hddesktopwallpapers.in/wp-content/uploads/2015/09/resting-images.jpg'),
                    fit: BoxFit.cover,
                  ),
                  //color: Colors.teal,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 600,
                height: 900,
                padding: EdgeInsets.all(40),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            (
               Text(
                '${artical['title']}',
                //'Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title ',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.8,
                  fontWeight: FontWeight.bold
                ),
                 overflow: TextOverflow.ellipsis,
                maxLines: 4,
              )
            ),
          ],
         ),
       ),
     );
}

Widget myDivider() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget nave()
{
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    fixedColor: Colors.black,
    onTap: (index){

    },
    items: [
      BottomNavigationBarItem(
          icon: Icon
            (Icons.home,color: Colors.black),
          label: "home"
      ),
      BottomNavigationBarItem(
          icon: Icon
            (Icons.favorite,color: Colors.black),
          label: "favourite"
      ), BottomNavigationBarItem(
          icon: Icon
            (Icons.settings,color: Colors.black,),
          label: "setting"
      ),
    ],
  );
}

void navigateTo(context,widget) => Navigator.push(
  context ,
  MaterialPageRoute(
      builder: (context) => widget,
  ),
);

Widget buildListForSearchScreen(list,context)
{
  return  ConditionalBuilder(
    fallback: (context) => Center(child: Text('this is not true')),
    condition: list.length > 0,
    builder: (context) => CarouselSlider.builder(
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
  );
}
