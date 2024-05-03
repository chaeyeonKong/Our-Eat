import 'package:flutter/material.dart';
import 'package:frontend/widget/bottomNavigation.dart';

class MenuPage extends StatelessWidget {
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
                '가격 설정하기',
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
          crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
          children: [
            Row(
              children: [
                SizedBox(width: 15.0),
                CategoryText(text: '10,000'),
                CategoryText(text: '20,000'),
                CategoryText(text: '30,000'),
                CategoryText(text: '40,000'),
              ],
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left:5.0),
              child: Text(
                '(10,000원 이하 공동구매)',
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: MenuList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GoogleBottomBar(),
    );
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 가로로 2개의 아이템을 배치
      mainAxisSpacing: 8.0, // 수직 간격 설정
      crossAxisSpacing: 15.0, // 수평 간격 설정
      children: List.generate(
        10, // 상품 개수 설정 (임의로 10개로 설정)
            (index) {
          return MenuItem(index: index);
        },
      ),
    );
  }
}
class MenuItem extends StatelessWidget {
  final int index;

  const MenuItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/menu$index.jpg', // 상품 이미지 경로 (예: assets/product_0.jpg)
            width: 100, // 이미지의 너비 설정
            height: 100, // 이미지의 높이 설정
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              '메뉴명 $index', // 상품 이름 (예: 상품 0)
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),// 이미지와 텍스트 사이의 간격 조절
        ],
      ),
    );
  }
}

// Custom widget for category text
class CategoryText extends StatelessWidget {
  final String text;

  const CategoryText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // 카테고리가 선택될 때 수행할 동작
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.underline, // 텍스트에 밑줄 추가
              decorationColor: Colors.green,
              decorationThickness: 3.0,
            ),
          ),
        ),
      ),
    );
  }
}
