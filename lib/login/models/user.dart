import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  var userid;
  String userName;
  String userGender;
  DateTime userDob;
  String userAddress;
  String userCity;
  String userDistrict;
  String userState;
  String userPinCode;
  String userAadhar;
  String userPhone;
  String userEmail;
  String userLogin;
  String userPassword;
  int profileCode;
  var isActive;
  User({
    this.userid,
    required this.userName,
    required this.userGender,
    required this.userDob,
    required this.userAddress,
    required this.userCity,
    required this.userDistrict,
    required this.userState,
    required this.userPinCode,
    required this.userAadhar,
    required this.userPhone,
    required this.userEmail,
    required this.userLogin,
    required this.userPassword,
    required this.profileCode,
    this.isActive,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        userid: json['userid'],
        userName: json['userName'],
        userGender: json['userGender'],
        userDob: json['userDOB'] is String ?DateTime.parse(json['userDOB']):json['userDOB'],
        userAddress: json['userAddress'],
        userCity: json['userCity'],
        userDistrict: json['userDistrict'],
        userState: json['userState'],
        userPinCode: json['userPinCode'],
        userAadhar: json['userAadhar'],
        userPhone: json['userPhone'],
        userEmail: json['userEmail'],
        userLogin: json['userLogin'],
        userPassword: json['userPassword'],
        profileCode: json['profileCode'],
        isActive: json['isActive'],
      );

  Map<String, dynamic> toMap() => {
        'userid': userid,
        'userName': userName,
        'userGender': userGender,
        'userDOB':
            "${userDob.year.toString().padLeft(4, '0')}-${userDob.month.toString().padLeft(2, '0')}-${userDob.day.toString().padLeft(2, '0')}",
        'userAddress': userAddress,
        'userCity': userCity,
        'userDistrict': userDistrict,
        'userState': userState,
        'userPinCode': userPinCode,
        'userAadhar': userAadhar,
        'userPhone': userPhone,
        'userEmail': userEmail,
        'userLogin': userLogin,
        'userPassword': userPassword,
        'profileCode': profileCode,
        'isActive': isActive,
      };
}

class UserDB {
  Future fetchUsers() async {
    final response = await http
        .get(Uri.parse('http://69.120.72.72:32500/api/account/users'));
    var users = <User>[];
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var data = jsonDecode(response.body);
      if (data['status'] == 'ok') {
        for (var i in data['data']) {
          users.add(User.fromMap(i));
        }
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return 'Failed to load Users';
    }
    return users;
  }

  Future createUser(User user) async {
    final response = await http.post(
        Uri.parse('http://69.120.72.72:32500/api/account/register'),
        body: jsonEncode(user.toMap()),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == 'ok') {
        return User.fromMap(data['data'][0]);
      } 
    } else if (response.statusCode == 500) {
      var data = jsonDecode(response.body);
      return data["error"];
    } else {
      return 'Failed to send data';
    }
  }

  Future auth(username, password) async {
    final token = base64Encode(utf8.encode('$username:$password'));
    final response = await http.post(
        Uri.parse('http://69.120.72.72:32500/api/account/auth'),
        headers: {
          'Authorization': 'Basic $token',
          'Content-Type': 'application/json'
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data['status'] == 'ok') {
        return User.fromMap(data['user']);
      }
    } else if (response.statusCode == 500) {
      var data = jsonDecode(response.body);
      return data["error"];
    }
  }
}
