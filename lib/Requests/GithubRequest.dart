import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.github.com/';
  // static String clientId = 'Your_github_client_id';
  // static String clientSecret = 'Your_github_client_secret';

  // final String query = "?client_id=$clientId&client_secret=$clientSecret";

  Github(this.userName);

  Future<http.Response> fetchUser() {
    return http.get(url + 'users/' + userName);
  }

  Future<http.Response> fetchFollowing() {
    return http.get(url + 'users/' + userName + '/repos');
  }
}
