import 'dart:ffi';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testt/layout/newslayout.dart';
import 'package:testt/loginnew.dart';


import 'dart:ffi';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:testt/loginnew.dart';


class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override

  var mypassword, myemail, lastname, fristname;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  signup() async {
    var formadate = formstate.currentState;
    if (formadate?.validate() != null) {
      formadate?.save();
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              headerAnimationLoop: false,
              context: context,
              title: "Error",
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "the passpword is too weak ",
                  style: TextStyle(),
                ),
              ))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              headerAnimationLoop: false,
              context: context,
              title: "Error",
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "The account already exists, please enter another email",
                  style: TextStyle(),
                ),
              ))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30)), // Image border
                    child: Image.asset(
                        'lib/images/photo-1618022325802-7e5e732d97a1.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0) + EdgeInsets.only(top: 7),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'WELCOME TO BBC NEWS App',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey,
                          fontFamily: ''),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 17, bottom: 18),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 32,
                              color: Colors.black,
                              fontFamily: ''),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                    key: formstate,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (val) {
                              fristname = val;
                            },
                            validator: (String? value) {
                              if (value != null && value.length < 2) {

                                return 'please enter your frist name';
                              } else if (value != null && value.length > 2)
                                return null;
                              else {

                                return 'frist name can not be less than 3 letter';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'frist name',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width:
                                    1), /* borderRadius: BorderRadius.circular(19)*/
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (value) {
                              lastname = value;
                            },
                            validator: (String? value) {
                              if (value != null && value.length < 2) {

                                return 'please enter your last name';
                              } else if (value != null && value.length > 2)
                                return null;
                              else {

                                return 'last name can not be less than 3 letter';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'last name',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width:
                                    1), /* borderRadius: BorderRadius.circular(19)*/
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (val) {
                              myemail = val;
                            },
                            validator: (String? value) {
                              if (value != null && value.length < 2) {

                                return 'please enter your Email';
                              } else if (value != null && value.length > 2)
                                return null;
                              else {
                                return 'Email can not be less than 3 letter';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.message_rounded),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width:
                                      1), /*  borderRadius: BorderRadius.circular(19)*/
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value != null && value.length < 2) {

                                return 'please enter your password';
                              } else if (value != null && value.length > 2)
                              { return null;}
                              else {
                                return 'password can not be less than 3 letter';
                              }
                            },
                            onSaved: (val) {
                              mypassword = val;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIconColor: Colors.black,
                              hintText: 'password',
                              prefixIcon: Icon(Icons.password_rounded),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width:
                                    1), /*  borderRadius: BorderRadius.circular(19)**/
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              UserCredential response = await signup();
                              print(response.user?.email);

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => login()));

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors
                                    .black, /* borderRadius: BorderRadius.circular(19)*/
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text('if you have already acount ? ',
                                    style: TextStyle(fontWeight: FontWeight.w700)),
                                GestureDetector(
                                  child: Text(
                                    'go to login page',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            )));
  }
}
