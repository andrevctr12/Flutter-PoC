// import 'dart:async';

// import 'package:app_mecanica/utils/network_util.dart';
// import 'package:app_mecanica/models/user.dart';
// import 'package:app_mecanica/models/consumer.dart';

// class RestDataSource {
//   NetworkUtil _netUtil = new NetworkUtil();
//   static final BASE_URL = "http://YOUR_BACKEND_IP/login_app_backend";
//   static final LOGIN_URL = BASE_URL + "/login";
//   static final CONSUMER_URL = BASE_URL + "/consumer";
//   static final _API_KEY = "somerandomkey";

//   Future<User> login(String username, String password) {
//     return _netUtil.post(LOGIN_URL, body: {
//       "token": _API_KEY,
//       "username": username,
//       "password": password
//     }).then((dynamic res) {
//       print(res.toString());
//       if(res["error"]) throw new Exception(res["error_msg"]);
//       return new User.map(res["user"]);
//     });
//   }

//   Future<Consumer> getConsumers() {
//     return _netUtil.get(CONSUMER_URL).then((dynamic res) {
//       print(res.toString());
      
//       if(res["error"]) throw new Exception(res['error_msg']);
//       return new Consumer.map(res['consumer']);
//     });
//   }
// }