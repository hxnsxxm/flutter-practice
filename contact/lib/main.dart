import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 앱의 메인페이지
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 3, // 반복 횟수
          itemBuilder: (context, i) { // 함수
            print(i); // console에 출력
            return ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('홍길동')
            );
          },
        ),
        bottomNavigationBar: CustomBottomBar(),
      )
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.phone),
          Icon(Icons.message),
          Icon(Icons.contact_page),
        ],
      ),
    );
  }
}
