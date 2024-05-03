import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
      children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./assets/background1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        ),
      Container(
        color: Colors.black.withOpacity(0.7),
        ),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                '로그인',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 100.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white.withOpacity(0.4), // 흰색 배경에 불투명하게 설정
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: '아이디',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white.withOpacity(0.4), // 흰색 배경에 불투명하게 설정
              ),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: '비밀번호',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            SizedBox(
              width:300.0,
              child: ElevatedButton(
                onPressed: (){
                  //눌렀을 때 로직 구현
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.6), // 버튼의 배경색을 불투명 흰색으로 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 버튼의 테두리를 동그랗게 설정
                  ),
                ),
                child: Text('로그인'),
              ),

            ),
            SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                // 회원가입 로직 추가
              },
              child: Text(
                '회원가입하기',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline, // 밑줄 추가
                ),
              ),
            ),
          ],
        ),
      ),
    ],
    ),
    );
  }
}
