import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'package:flutter_ecom_app/components/horizontal_listview.dart';
import 'package:flutter_ecom_app/components/product.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cart.dart';
import 'package:flutter_ecom_app/classes/user.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'dart:io' as I;
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  final User loginUser ;


  const MyHomePage({Key key, this.loginUser}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState(loginUser);
}

class _MyHomePageState extends State<MyHomePage> {

  final User loginUser;
  _MyHomePageState(this.loginUser);
  //===============================init state=====================================
  Future<I.File> file;
  String status = '';
  String base64Image;
  I.File tmpFile;
  String errMessage = 'Error Uploading Image';
  bool picUpload = false;
  bool picAlreadyInDB , wantToUpdateImageFromDB;
  var bytes ;

  @override
  void initState() {
    // TODO: implement initState
    wantToUpdateImageFromDB = false;
    if(loginUser.upic == null)
    {
      tmpFile = null;
      picAlreadyInDB =false;
    }
    else
      {
        bytes=base64Decode(loginUser.upic);
        picAlreadyInDB = true;

      }
  }

  //===============================FOR image picker==============================
  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  showToast(String s) {
    Fluttertoast.showToast(
        msg:  s,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  upload() async {
    String uploadEndPoint = 'http://192.168.43.12/TestApi/api/shoppingApp/UpdatePicture';

    if(base64Image == null)
      setStatus("image is null");
    else
      {
        String n = loginUser.uname, img = base64Image;
        final result=await http.put(uploadEndPoint,headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
            body:jsonEncode( <String, String> {
              "uname":loginUser.uname,
              "upic": img
            }));
        if(result.statusCode == 200) {
          setStatus("Updated Successfully");
          picUpload= true;
          picAlreadyInDB = true;
        }else {
          setStatus(result.body);
          picUpload = false;
        }
      }
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  Widget showImage() {
    return FutureBuilder<I.File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<I.File> snapshot) {
        if(picAlreadyInDB && !wantToUpdateImageFromDB)
        {
          return CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 30,
            backgroundImage: MemoryImage(bytes),
          );
        }
        if (snapshot.connectionState == ConnectionState.done && null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(tmpFile.readAsBytesSync());
          upload();
          if(picUpload) {
            setState(() {
              wantToUpdateImageFromDB = false;
            });
            showToast(status);
            return CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              backgroundImage: FileImage(tmpFile),
            );
          }
          else {
            //showToast();
            return CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
                backgroundImage: AssetImage("Images/products/blazer2.jpeg")
            );
          }

        } else if (null != snapshot.error) {
          return CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              backgroundImage: AssetImage("Images/products/blazer2.jpeg")
          );
        } else {
          return CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              backgroundImage: AssetImage("Images/person-male.png")
          );
        }
      },
    );
  }
  //======================= for Slideshow=============-====================
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('Images/c1.jpg'),
          AssetImage('Images/IMG_1266.JPG'),
          AssetImage('Images/m1.jpeg'),
          AssetImage('Images/m2.jpg'),
          AssetImage('Images/w1.jpeg'),
          AssetImage('Images/w3.jpeg'),
          AssetImage('Images/w4.jpeg')
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotColor: Colors.red,
        dotBgColor: Colors.transparent,
      ),
    );

    //====================================main screen================================
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text("Shopping App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()))
          }),
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: ()=>{}),

        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(loginUser.uname),
              accountEmail: Text('Rs: '+loginUser.ucash.toString()),
              currentAccountPicture: GestureDetector(
                onTap: (){
                  setState(() {
                    wantToUpdateImageFromDB =(picAlreadyInDB)? true:false;
                  });
                  chooseImage();
                 },
                child: showImage(), //user define widget
              ),
              decoration: BoxDecoration(
                color: Colors.red,

              ),
            ),

            //body

            InkWell(
              onTap: ()=>{},
              child: ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: ()=>{},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: ()=>{},
              child: ListTile(
                title: Text('My Order'),
                leading: Icon(Icons.shopping_basket, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()))
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: ()=>{},
              child: ListTile(
                title: Text('Favourite'),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: ()=>{
                Navigator.of(context).pop(),
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout, color: Colors.red,),
              ),
            ),

            Divider(
              color: Colors.grey,
            ),

            InkWell(
              onTap: ()=>{},
              child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings, ),
              ),
            ),

            InkWell(
              onTap: ()=>{},
              child: ListTile(
                title: Text('About us'),
                leading: Icon(Icons.help, color: Colors.blue,),
              ),
            ),
          ],
        ),
      ),
      //======================================body=============================================
      body: Column
        (children:<Widget>[
        //slideShow
        image_carousel,
        //text
        Padding(padding:EdgeInsets.all(12.0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Categories')),),
        HorizontalList(),

        Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
              alignment: Alignment.centerLeft ,
              child: Text('Recent Products')),
        ),

        //GRid View
        Flexible(child:Products(),)
      ],),
    );
  }
}
