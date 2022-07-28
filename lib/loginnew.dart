import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testt/layout/newslayout.dart';
import 'package:testt/register.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  var mypassword, myemail;
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  // late UserCredential userCredential;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                'WELCOME BACK TO BBC NEWS App',
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
            padding: const EdgeInsets.all(15.0) -
                EdgeInsets.only(top: 10) +
                EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                        color: Colors.black,
                        fontFamily: ''),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            child: Text(
                          "Help",
                          style: TextStyle(color: Colors.grey),
                        )),
                        Container(
                            child: Icon(
                          Icons.help,
                          color: Colors.grey,
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                /* Text(
                "E Mail",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),*/
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 30, top: 5),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10, top: 5, bottom: 5),
                      child: TextFormField(
                        controller: _emailcontroller,
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
                            border: InputBorder.none, hintText: "Email"),
                      ),
                    ),
                  ),
                ),
                /* Padding(
                padding: const EdgeInsets.only( top: 20),
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),*/
                Padding(
                  padding:
                      const EdgeInsets.only(right: 30.0, left: 30, top: 25),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: TextFormField(
                        controller: _passwordcontroller,
                        validator: (String? value) {
                          if (value != null && value.length < 2) {
                            return 'please enter your password';
                          } else if (value != null && value.length > 2)
                            return null;
                          else {
                            return 'password can not be less than 3 letter';
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "password"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(10.0) + EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text("Forgot Password ?",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {

              if (_formkey.currentState!.validate()) {
                var result = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailcontroller.text,
                        password: _passwordcontroller.text);

                if (result != null) {
                  // pushReplacement

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  print('user not found');
                }
              }
            },
            child: Container(
              margin: EdgeInsets.all(25) - EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
                height: 54,
                child: Center(
                    child: Text(
                  'LogIn',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )),
              ),
            ),
          ),
          /*Center(
            child: Text(
              "----------------- OR -----------------",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),*/
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text("Dosen't has any account ?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => register()));
                },
                child: Text("click for Registration",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
