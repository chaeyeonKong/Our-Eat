import 'package:flutter/material.dart';
import 'package:frontend/screen/home.dart';
import 'package:frontend/service/api_service.dart';
import 'package:frontend/widget/bottomNavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: selectRegion(),
    );
  }
}

class selectRegion extends StatefulWidget {
  @override
  _selectRegionState createState() => _selectRegionState();
}

class _selectRegionState extends State<selectRegion> {
  final List<String> do_list = ["서울", "경기", "인천", "부산", "대구", "경남", "경북"];

  final List<String> gu_list = [
    "마포구",
    "강남구",
    "강동구",
    "강북구",
    "강서구",
    "관악구",
    "광진구",
    "구로구",
    "금천구",
    "노원구",
    "도봉구",
    "동대문구",
    "동작구",
    "서대문구",
    "서초구",
    "성동구",
    "성북구",
    "송파구",
    "양천구",
    "영등포구",
    "용산구",
    "은평구",
    "종로구",
    "중구",
    "중랑구"
  ];
  List<String> dongList = [];

  int selectedGuIndex = -1; // 선택한 구의 인덱스를 저장하는 변수
  Set<int> selectedDongIndices = {}; // 선택한 동의 인덱스를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        flexibleSpace: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                '지역선택',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 40, // 버튼 영역의 높이
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                itemCount: do_list.length, // 버튼 개수
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 100, // 버튼 width 지정
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white70, // 버튼 배경색
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(90.0), // 둥근 모서리 설정
                          ),
                        ),
                        child: Text(
                          do_list[index],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Container(
                      height: 450,
                      child: ListView.builder(
                        itemCount: gu_list.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // 클릭 이벤트 처리
                              print('Gu ${gu_list[index]} clicked');

                              // 버튼 클릭 시 동작
                              print('Button $index clicked');
                              setState(() {
                                dongList = [
                                  "전체",
                                  "공덕동",
                                  "구수동",
                                  "노고산동",
                                  "당인동",
                                  "대흥동",
                                  "도화동",
                                  "마포동",
                                  "망원동",
                                  "상암동",
                                  "상수동",
                                  "서교동",
                                  "성산동",
                                  "신공덕동",
                                  "신수동",
                                  "신정동",
                                  "아현동",
                                  "염리동",
                                  "용강동",
                                  "중동",
                                  "창전동",
                                  "토정동",
                                  "하중동",
                                ];
                                selectedGuIndex = -1; // 선택한 구 인덱스 초기화
                                selectedDongIndices.clear(); // 선택한 동 초기화
                              });
                              setState(() {
                                if (selectedGuIndex == index) {
                                  selectedGuIndex =
                                      -1; // 이미 선택된 구를 다시 클릭하면 선택 취소
                                } else {
                                  selectedGuIndex = index; // 선택한 구의 인덱스 갱신
                                }
                                selectedDongIndices.clear(); // 선택한 동 초기화
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 60,
                              color: selectedGuIndex == index
                                  ? Colors.black // 선택한 구일 경우 배경색을 검정색으로 변경
                                  : Colors.transparent, // 선택되지 않은 구는 투명 배경
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
                                children: [
                                  Center(
                                    child: Text(
                                      gu_list[index],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: selectedGuIndex == index
                                              ? Colors
                                                  .white // 선택한 구일 경우 텍스트색을 흰색으로 변경
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                      height: 450,
                      child: ListView.builder(
                        itemCount: dongList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // 클릭 이벤트 처리
                              print('Dong ${dongList[index]} clicked');
                              setState(() {
                                if (selectedDongIndices.contains(index)) {
                                  selectedDongIndices.remove(index);
                                } else {
                                  selectedDongIndices.add(index);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              width: 100,
                              height: 60,
                              color: selectedDongIndices.contains(index)
                                  ? Colors.black // 선택한 동일 경우 배경색을 회색으로 변경
                                  : Colors.transparent, // 선택되지 않은 동은 투명 배경
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dongList[index],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: selectedDongIndices.contains(index)
                                          ? Colors
                                              .white // 선택한 동일 경우 텍스트색을 흰색으로 변경
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                // 완료 텍스트 클릭 이벤트 처리
                print('완료 버튼 클릭');
                print(
                    '선택한 구: ${selectedGuIndex != -1 ? gu_list[selectedGuIndex] : "구를 선택하세요"}');
                print('선택한 동:');
                if (selectedDongIndices.isEmpty) {
                  print('동을 선택하세요');
                } else {
                  try {
                    List<int> li = [];
                    selectedDongIndices.forEach((index) {
                      li.add(index);
                    });
                    print(li);
                    Map<String, dynamic> response = await ingredients('', li);

                    print("Response: $response");
                    if (response["message"] == 'Success') {
                      print("성공");
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SignInPage()));
                    }
                    // response['data'];
                  } catch (e) {
                    print("signUp Request Error: $e");
                  }
                  //

                  selectedDongIndices.forEach((index) {
                    print(dongList[index]);
                  });
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 40,
                color: Colors.green,
                child: Text(
                  "완료",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GoogleBottomBar(),
    );
  }
}
