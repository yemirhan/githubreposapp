import 'dart:developer';

class User {
  final String login;
  final String avatarUrl;
  final String htmlUrl;

  User(this.login, this.avatarUrl, this.htmlUrl);

  Map toJson() => {'login': login, 'avatarUrl': avatarUrl, 'htmlUrl': htmlUrl};

  User.fromJson(Map json)
      : login = json['login'],
        avatarUrl = json['avatarUrl'],
        htmlUrl = json['htmlUrl'];
}
