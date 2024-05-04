import 'package:flutter/material.dart';
import 'package:frontend/screen/signIn.dart';
import 'package:frontend/widget/bottomNavigation.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      home: Scaffold(
        body: ChatScreen(),
        bottomNavigationBar: GoogleBottomBar(),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20, // 대화 목록의 예시를 위해 임의의 숫자를 지정합니다.
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('A'), // 대화 상대의 이니셜이나 프로필 이미지를 표시합니다.
                  ),
                  title: Text('User $index'),
                  subtitle: Text('Message $index'), // 마지막 메시지를 표시합니다.
                  trailing: Text('12:34'), // 마지막 메시지의 시간을 표시합니다.
                );
              },
            ),
          ),
          Divider(height: 0), // 대화 목록과 하단 입력창을 구분하는 구분선입니다.
          _buildMessageInput(), // 하단에 메시지 입력창을 표시합니다.
          TransparentButton(), // 투명 버튼을 표시합니다.
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '메시지를 입력하세요...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // 메시지 전송 기능을 구현할 수 있습니다.
            },
          ),
        ],
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          // 페이지 이동 기능을 구현합니다.
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
        },
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('다음 페이지'),
      ),
    );
  }
}
