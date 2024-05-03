import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "http://172.16.200.163:8080";
// 회원가입
Future<Map<String, dynamic>> signup(String? loginId, String? password) async {
  final url = Uri.parse('$baseUrl/api/v1/user/join');
  final data = jsonEncode({"userName": loginId, "password": password});
  try {
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: data);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    print(jsonData);
    return jsonData;
  } catch (error) {
    print('error: $error');
    throw Error();
  }
}

// 로그인
Future<Map<String, dynamic>> login(
  String loginId,
  String password,
) async {
  final url = Uri.parse('$baseUrl/auth/signIn');
  final data = jsonEncode({
    'loginId': loginId,
    'password': password,
  });
  try {
    http.Response res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: data);
    Map<String, dynamic> jsonData = jsonDecode(res.body);
    return jsonData;
  } catch (error) {
    print('error: $error');
    throw Error();
  }
}

// 유저 정보 get
Future<Map<String, dynamic>> getUserDetail() async {
  final url = Uri.parse('$baseUrl/auth/detail');
  try {
    http.Response res = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
    );
    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(res.bodyBytes));
    return jsonData;
  } catch (error) {
    print('error: $error');
    throw Error();
  }
}
