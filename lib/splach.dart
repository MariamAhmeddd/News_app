import 'package:flutter/material.dart';
import 'dart:async';

import 'package:testt/loginnew.dart';
import 'package:testt/register.dart';
class splach extends StatefulWidget {
  const splach({Key? key}) : super(key: key);

  @override
  State<splach> createState() => _splachState();
}

class _splachState extends State<splach> {
  @override
  void initState() {
   Timer(Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder:(context)=> register())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text('BBC',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),)),
    );
  }
}
