import 'dart:async';

import 'package:quizo/utils/network_util.dart';
import 'package:quizo/models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://ec2-13-127-166-221.ap-south-1.compute.amazonaws.com/SchoolRegistrationServices/1.0.0";
  static final LOGIN_URL = BASE_URL + "/api/login";
  static final _API_KEY = "somerandomkey";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "emailId": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}