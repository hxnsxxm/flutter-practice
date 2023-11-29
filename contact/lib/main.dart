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
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 3, // 반복 횟수
          itemBuilder: (context, i) { // 함수
            return ListTile(
              leading: Text(like[i].toString()),
              title: Text(name[i]),
              trailing: ElevatedButton(
                child: Text('좋아요'),
                onPressed: () {
                  setState(() {
                    like[i]++;
                  });
                },
              ),
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
