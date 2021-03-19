import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<LoginResponse> createLoginState(String email, String password) async {

  Map<String,String> headers = {'Content-Type':'application/json'};
  final msg = jsonEncode({'email':email,'password':password});
  final http.Response response = await http.post(
      'https://w-deposit.herokuapp.com/api/login',
      headers: headers,
      body: msg);

print(response.statusCode);
print((response.body));
  if (response.statusCode == 200) {
    print(response.body);
    return LoginResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class LoginResponse {
  String token;


  LoginResponse(
      {this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];

  }
}