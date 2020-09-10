import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:githubreposapp/Models/User.dart';
import 'package:githubreposapp/Requests/GithubRequest.dart';

class UserProvider with ChangeNotifier {
  User user;
  String errorMessage;
  bool loading = false;

  Future<bool> fetchUser(username) async {
    setLoading(true);

    await Github(username).fetchUser().then((data) {
      setLoading(false);

      if (data.statusCode == 200) {
        setUser(User.fromJson(json.decode(data.body)));
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });

    return isUser();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() => loading;

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  User getUser() => user;

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() => errorMessage;

  bool isUser() => user != null ? true : false;
}
