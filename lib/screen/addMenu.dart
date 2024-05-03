import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              title: Text('찾고싶은 메뉴를 검색해주세요'),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              content: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // 화면 너비의 80%를 사용
                  height: MediaQuery.of(context).size.height * 0.5, // 화면 높이의 50%를 사용
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: '검색어를 입력하세요',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        child: ListView.builder(itemCount: 10,
                          itemBuilder: (context, index){
                            return ListTile(
                              title: Text('검색 결과 $index'),
                              onTap: () {
                                //검색 결과를 선택했을 때의 동작
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        ),
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