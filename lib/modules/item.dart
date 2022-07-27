//import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testt/layout/screens/busniess.dart';
import 'package:testt/layout/screens/details.dart';
import 'package:testt/layout/screens/health.dart';
import 'package:testt/layout/screens/science.dart';
import 'package:testt/layout/screens/sports.dart';
import 'package:testt/layout/screens/technology.dart';

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

Widget buildItemForCatagoryScreen(artical,context)
{

  //artical = index
  String photo='';
  String text='';
  if(artical == 0)
  {
    photo = 'https://th.bing.com/th/id/R.7ab6536170b72137bde1f857970ec78f?rik=WKYFxksqHHJ%2b9g&pid=ImgRaw&r=0';
    text = 'BUSNIESS';
  }
  if(artical == 1)
  {
    photo = 'https://th.bing.com/th/id/R.1ddebd2c242ab22c53d69b5984c5be44?rik=NWWF34pMDSXJ%2fQ&riu=http%3a%2f%2fwww.highlandradio.com%2fwp-content%2fuploads%2f2013%2f08%2fsport.jpg&ehk=B%2fMzKgWN%2bzcwau3WD7d05sO1eqhGQ%2f13gjwmt8rJkV4%3d&risl=&pid=ImgRaw&r=0';
    text = 'SPORTS';
  }
  if(artical == 2)
  {
    photo = 'https://media.visualstories.com/uploads/images/1/5/5235056-1280_624033418-flask-in-scientist-hand-with-laboratory-background_l.jpg';
    text = 'SCIENCE';
  }
  if(artical == 3)
  {
    photo = 'https://video.cgtn.com/news/79596a4e78517a4e794d444d3567444f3359444f31457a6333566d54/video/114cac2b63234793b45515659246e188/114cac2b63234793b45515659246e188.jpg';
    text = 'HEALTH';
  }
  if(artical == 4)
  {
    photo = 'https://th.bing.com/th/id/OIP.7KXbdcsH9BKcYhKmd8hymAHaEu?pid=ImgDet&rs=1';
    text = 'TECHNOLOGY';
  }
  return
    //padding: const EdgeInsets.all(0.0),
    InkWell(
      onTap: (){
        if(artical == 0)
        {
          navigateTo(context, BusinessScreen());
        }
        if(artical == 1)
        {
          navigateTo(context, SportsScreen());
        }
        if(artical == 2)
        {
          navigateTo(context, ScienceScreen());
        }
        if(artical == 3)
        {
          navigateTo(context, HealthScreen());
        }
        if(artical == 4)
        {
          navigateTo(context, TechnologyScreen());
        }
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
                    image: NetworkImage('${photo}'),
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
                  '${text}',
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

Widget buildListForCatagoryScreen(list,context)
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
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => buildItemForCatagoryScreen(itemIndex,context),
    ),
  );
}


//Sohyla

Widget buildArticleItem(context,article) => InkWell(
  onTap: (){
    // pic , title ,detail , date
    navigateTo(context, details('${article['urlToImage']}', '${article['title']}','${article['description']}','${article['publishedAt']}'));
  },
  child:   Container(

    margin: EdgeInsets.all(12.0),

    padding: EdgeInsets.all(8.0),

    decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(12.0),

        boxShadow: [

          BoxShadow(

            color: Colors.black12,

            blurRadius: 3.0,

          ),

        ]),

    child: Column(

      mainAxisAlignment: MainAxisAlignment.start,

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Container(

          height: 200.0,

          width: double.infinity,

          decoration: BoxDecoration(

            //let's add the height



            image: DecorationImage(

                image: NetworkImage('${article['urlToImage']}'), fit: BoxFit.cover),

            borderRadius: BorderRadius.circular(12.0),

          ),

        ),

        SizedBox(

          height: 8.0,

        ),

        Container(

          padding: EdgeInsets.all(6.0),

          decoration: BoxDecoration(

            color: Colors.red,

            borderRadius: BorderRadius.circular(30.0),

          ),

          child: Text(

            '${article['publishedAt']}',

            style: TextStyle(

              color: Colors.white,

            ),

          ),

        ),

        SizedBox(

          height: 8.0,

        ),

        Text(

          '${article['title']}',

          style: TextStyle(

            fontWeight: FontWeight.bold,

            fontSize: 16.0,

          ),

        )

      ],

    ),

  ),
);