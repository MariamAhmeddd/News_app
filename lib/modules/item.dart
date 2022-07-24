import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildItem(artical)
{
  return
    //padding: const EdgeInsets.all(0.0),
     InkWell(
       onTap: (){

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