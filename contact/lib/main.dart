import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 앱의 메인페이지
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            setState(() {
              a++;
            });
          },
        ),
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 3, // 반복 횟수
          itemBuilder: (context, i) { // 함수
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
