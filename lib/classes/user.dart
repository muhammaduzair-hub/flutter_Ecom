import 'dart:io';

class User {
  final int userId;

  final String uname;
  final String upass;
  final double ucash;
  final double ubill;
  final String upic;

  User({this.userId,this.uname, this.upass, this.upic, this.ucash, this.ubill});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['uid'],
      uname:  json['uname'],
      upass: json['upass'],
      upic: json['upic'],
      ucash: json['ucash'],
      ubill: json['ubill']
    );
  }
}

//
// class User{
//   final int _uid;
//   final String _uname;
//   final String _upass;
//   final File _uimage;
//   final double _ucash;
//   final double _ubill;
//
//   // User(
//   //   this._uid,
//   //   this._upass,
//   //   this._uname,
//   //   this._ubill,
//   //   this._ucash,
//   //   this._uimage
//   // );
//
//   // int get uid => _uid;
//   // String get uname => _uname;
//   // String get upass => _upass;
//   // File get uimage => _uimage;
//   // double get ucash => _ucash;
//   // double get ubill => _ubill;
//   //
//   // set name(String Setuname)
//   // {
//   //   _uname = Setuname;
//   // }
//   //
//   // set password(String Setpass)
//   // {
//   //   _upass = Setpass;
//   // }
//
//
//     // var map = Map<String, dynamic>();
//     //
//     // map["uname"] = _uname;
//     // map["upass"] = _upass;
//     // map["upic"] = _uimage;
//     // map["ucash"] = _ucash;
//     // map["ubill"] = _ubill;
//     //
//     // if(_uid != null)
//     // {
//     //   map["uid"] = _uid;
//     // }
//     // return map;
//   }
//
//   User.fromObject(dynamic o)
//   {
//     this._uid = o["uid"];
//     this._uname = o["uname"];
//     this._upass = o["upass"];
//     this._uimage = o["upic"];
//     this._ucash = o["ucash"];
//     this._ubill = o["ubill"];
//   }
// }
//
// factory User.fromJson(Map<String, dynamic> json){
// return User(
// this._uid :json["uid"],
// this._uname : json["uname"],
// this._upass : json["upass"],
//
// );