import 'package:flutter/material.dart';
import 'package:frontend/widget/bottomNavigation.dart';

class IngredientsPage extends StatelessWidget {
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
                '재료 사기',
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
                SizedBox(width: 20.0),
                Text('10,000',
                  style:TextStyle(fontSize:23,fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: Colors.green, decorationThickness: 3.0)),
                SizedBox(width: 20),
                Text('20,000',
                    style:TextStyle(fontSize:20,decoration: TextDecoration.underline, decorationColor: Colors.black)),
                SizedBox(width: 20),
                Text('30,000',
                  style:TextStyle(fontSize:20,decoration: TextDecoration.underline, decorationColor: Colors.black)),
                SizedBox(width: 20),
                Text('40,000',
                  style:TextStyle(fontSize:20,decoration: TextDecoration.underline, decorationColor: Colors.black),
                ),
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
              child: IngredientsList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GoogleBottomBar(),
    );
  }
}

class IngredientsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 가로로 2개의 아이템을 배치
      mainAxisSpacing: 8.0, // 수직 간격 설정
      crossAxisSpacing: 15.0, // 수평 간격 설정
      children: List.generate(
        10, // 상품 개수 설정 (임의로 10개로 설정)
            (index) {
          return IngredientsItem(index: index);
        },
      ),
    );
  }
}
class IngredientsItem extends StatelessWidget {
  final int index;

  const IngredientsItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // 모서리를 둥글게 만듭니다. 숫자를 조절하여 원하는 모양으로 변경할 수 있습니다.
            child: Image.asset(
              'assets/ingredient1.jpg', // 상품 이미지 경로 (예: assets/product_0.jpg)
              width: 140, // 이미지의 너비 설정
              height: 110, // 이미지의 높이 설정
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              '사과 한 박스', // 상품 이름 (예: 상품 0)
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), // 이미지와 텍스트 사이의 간격 조절
          SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              '선착순 2명 | 마감 1시간 전', // 상품 이름 (예: 상품 0)
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ), // 이미지와 텍스트 사이의 간격 조절
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

              color: Colors.black,
              decoration: TextDecoration.underline, // 텍스트에 밑줄 추가

              decorationThickness: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
