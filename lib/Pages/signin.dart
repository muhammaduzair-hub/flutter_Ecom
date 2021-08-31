import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/Pages/home.dart';
import 'package:flutter_ecom_app/classes/user.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var NameController  = TextEditingController();
  var PasswordController  = TextEditingController();
  bool _passwordshow, _loginButtonPresses ;
  User loginPerson;

  String errormsg = "";

  void getUser() async{
    String n = NameController.text;
    String p = PasswordController.text;

    final response = await http.get("http://192.168.43.12/TestApi/api/shoppingApp/UserLogin?name=$n&pass=$p");
    if(response.statusCode == 200)
      loginPerson = User.fromJson(jsonDecode(response.body));
    else{
      errormsg = response.body;
      loginPerson = null;}
  }

  void Signup() async{
    String n = NameController.text;
    String p = PasswordController.text;
    final response = await http.post(
        "http://192.168.43.12/TestApi//api/shoppingApp/SignupUser?name=$n&pass=$p"
    );
    if(response.statusCode == 200)
      loginPerson = User.fromJson(jsonDecode(response.body));
    else{
      errormsg = response.body;
      loginPerson = null;}
  }

  @override
  void initState() {
    // TODO: implement initState
    _passwordshow = true;
    _loginButtonPresses = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[500],
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
          children: <Widget>[
            Center(
              child: Text("MY Shopping App", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset("Images/c1.jpg", height: 200, width: 200,),
            ),

//==============================Email textfield========================
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                controller: NameController,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                decoration:InputDecoration(
                  suffixIcon: Icon(Icons.admin_panel_settings,color: Colors.transparent,),
                  prefixIcon: Icon(Icons.email, color: Colors.white,),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Enter Your Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.white),
                    gapPadding: 10
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 10,
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(28)
                  )
                ),
              ),
            ),


//==============================Password textfield========================
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                controller: PasswordController,
                obscureText: _passwordshow,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                decoration:InputDecoration(
                  prefixIcon: Icon(Icons.admin_panel_settings, color: Colors.white,),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordshow? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      setState(() {
                        _passwordshow = !_passwordshow;
                      });
                    },
                    color: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),

                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Enter Your Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.white),
                        gapPadding: 10
                    ),
                    focusedBorder: OutlineInputBorder(
                        gapPadding: 10,
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(28)
                    ),

                ),
              ),
            ),
            //===================Register Buttons======================================================
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      Signup();
                      if(loginPerson != null)
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>MyHomePage(loginUser: loginPerson,)
                        ));
                      else
                      {
                        Fluttertoast.showToast(
                            msg:errormsg != "" ? errormsg : "Something went wrong, please try again!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.red,
                            fontSize: 16.0
                        );
                        errormsg = "";
                      }
                      _loginButtonPresses = false;
                    },
                    color: Colors.white,
                    textColor: Colors.red,
                    child: Text("Register".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),

                  //============================login buton==================================================
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      onPressed: () {
                        _loginButtonPresses = true;
                        getUser();
                        if(loginPerson != null)
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>MyHomePage(loginUser: loginPerson,)
                          ));
                        else
                          {
                            Fluttertoast.showToast(
                                msg: errormsg != "" ? errormsg : "Something went wrong, please try again!",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.red,
                                fontSize: 16.0
                            );
                            errormsg = "";
                          }
                        _loginButtonPresses = false;
                      },
                      color: Colors.white,
                      textColor: _loginButtonPresses? Colors.blue : Colors.red,
                      child: Text("Sign In".toUpperCase(),
                          style: TextStyle(fontSize: 14)),

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
