import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 280,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background2.jpeg'),
                    fit: BoxFit.cover,
                  ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    '지역을 선택해주세요.',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  ),
                  SizedBox(height: 5.0), // 텍스트 사이의 간격을 조절합니다.
                  Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'MEDILUX 님,',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
          children: [
            SizedBox(height: 20.0),
            Padding(
                padding: EdgeInsets.only(left: 8.0),
              child: Text(
                '우리동네에서 지금,', // 첫 번째 줄 텍스트
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 8.0),
              child: Text(
                '가장 인기 있는 레시피', // 두 번째 줄 텍스트
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),// 첫 번째 줄 텍스트와 두 번째 줄 텍스트 사이의 간격

            SizedBox(height: 20.0), // 추가적인 세로 길이를 위한 여백 추가
            Expanded(
              child: ProductList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 가로로 2개의 아이템을 배치
      mainAxisSpacing: 8.0, // 수직 간격 설정
      crossAxisSpacing: 8.0, // 수평 간격 설정
      children: List.generate(
        10, // 상품 개수 설정 (임의로 10개로 설정)
            (index) {
          return ProductItem(index: index);
        },
      ),
    );
  }
}
class ProductItem extends StatelessWidget {
  final int index;

  const ProductItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/product$index.jpg', // 상품 이미지 경로 (예: assets/product_0.jpg)
            width: 100, // 이미지의 너비 설정
            height: 100, // 이미지의 높이 설정
          ),
          SizedBox(height: 8),
          Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                '상품명 $index', // 상품 이름 (예: 상품 0)
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
