import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screen/myRecipe.dart';
import 'package:frontend/widget/bottomNavigation.dart';

class AddMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF9F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBF9F5),
        toolbarHeight: 120,
        centerTitle: true, // title을 가운데로 정렬합니다.
        title: Padding(
          padding: EdgeInsets.only(top:70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '나만의 레시피 등록하기',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFieldWidget(),
          ],
        ),
      ),
      bottomNavigationBar: GoogleBottomBar(),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 텍스트 필드를 누르면 모달 창을 표시합니다.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              titlePadding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0.0),
              title: Text('찾고싶은 메뉴를 검색해주세요',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              content: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // 화면 너비의 80%를 사용
                  height: MediaQuery.of(context).size.height * 0.4, // 화면 높이의 50%를 사용
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                          color:Colors.grey[200],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '검색어를 입력하세요',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // 이미지와 텍스트 사이의 간격 조절
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddRecipePage()),
                          );
                        },
                        child: Image.asset(
                          'assets/menu2.jpg', // 이미지 경로
                          width: 120, // 이미지의 너비 설정
                          height: 120, // 이미지의 높이 설정
                        ),
                      ),
                      SizedBox(height: 10), // 텍스트와 다음 위젯 사이의 간격 조절
                      Text(
                        '떡볶이', // 텍스트 내용
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // dialog 닫기
                  },
                  child: Text('닫기'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10.0),
            Text(
              '메뉴 검색하기',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}