import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "http://172.16.200.163:8080";

// 회원가입
Future<Map<String, dynamic>> signup(String? username, String? password) async {
  final url = Uri.parse('$baseUrl/api/v1/user/join');
  final data = jsonEncode({"userName": username, "password": password});
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
  String userName,
  String password,
) async {
  final url =
      Uri.parse('$baseUrl/api/v1/ingredients?search={String}&dongNm={1, 2, 3}');
  final data = jsonEncode({
    'userName': userName,
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

//지역별 구매 가능 상품?정보 리스트 Get
// /api/v1/ingredients?search={String}&dongNm={1, 2, 3}
Future<Map<String, dynamic>> ingredients(
    String search, List<int> dongNm) async {
  var url = Uri.parse('$baseUrl/api/v1/ingredients?search=' '&dongNm=0');
  print(url);

  try {
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get match info: ${response.statusCode}');
    }
  } catch (e) {
    throw e;
  }
}
