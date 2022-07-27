import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testt/layout/screens/webview.dart';
import 'package:testt/modules/item.dart';


class details extends StatelessWidget{
  @override
  details(String p ,String t,String d,d2,u){
    this.picture=p;
    this.titile=t;
    this.detail=d;
    this.date=d2;
    this.url = u;
  }
  late String picture,date;
  late String titile;
  late String detail;
  late String url;
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
          body:SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.network(picture),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0)-EdgeInsets.only(bottom: 15),
                  child: Container(alignment: Alignment.topLeft,
                    child: Text("published : "+date,style: TextStyle(color: Colors.grey),),
                    height: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: (){
                      navigateTo(context, WebViewScreen(url));
                    },
                    child: Text(titile
                      ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0)-EdgeInsets.only(top: 15),
                    child: Text(detail
                      ,style: TextStyle(fontSize: 17),),

                  ),
                ),

              ],
            ),
          )

          ,bottomNavigationBar: nave()
    );
  }
}