import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OrderTogether(),
    );
  }
}

class OrderTogether extends StatefulWidget {
  const OrderTogether({Key? key}) : super(key: key);

  @override
  State<OrderTogether> createState() => _OrderTogetherState();
}

class _OrderTogetherState extends State<OrderTogether> {
  @override
  Widget build(BuildContext context) {
    String rating = "4.5";
    String view_ = "8.4만";
    return Scaffold(
      backgroundColor: Colors.grey[200], // 전체 배경 색상 설정
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                '함께 주문하기',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 30),
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100, 20, 0, 0),
                      child: Text(
                        '한국식 샤브샤브',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 200,
                  bottom: 10,
                  child: ClipRRect(
                    // 이미지를 동그랗게 잘라내기 위해 ClipRRect 위젯 사용
                    borderRadius: BorderRadius.circular(
                        20.0), // 반지름 값을 박스의 절반으로 설정하여 동그랗게 만듦
                    child: Image.asset(
                      'assets/tteok.png', // 이미지 경로
                      fit: BoxFit.cover, // 이미지를 박스에 맞추기 위해 cover로 설정
                    ),
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 165,
                  right: 0,
                  bottom: 10,
                  child: Text("★ $rating"),
                ),
                Positioned(
                  top: 55,
                  left: 220,
                  right: 0,
                  bottom: 10,
                  child: Text("주문 수 $view_"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '4명이 다 모였어요!',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 버튼이 눌렸을 때 수행할 작업
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: Image.asset(
                              'assets/test.png',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'User 1',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // 버튼이 눌렸을 때 수행할 작업
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: Image.asset(
                              'assets/test.png',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'User 2',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 버튼이 눌렸을 때 수행할 작업
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: Image.asset(
                              'assets/test.png',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'User 3',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // 버튼이 눌렸을 때 수행할 작업
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: Image.asset(
                              'assets/test.png',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'User 4',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 130),
                  child: Text(
                    '참여 인원:\n금액 확인:\n마감 기한:',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '4명\n39,000원/ 인당 \n5/5~5/8',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 60), // 버튼의 최소 크기를 지정합니다. (width, height)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                '39,000원 주문하기',
                style: TextStyle(
                  color: Colors.black, // 폰트 색상을 지정합니다.
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
