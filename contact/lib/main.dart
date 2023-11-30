import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home:MyApp()
    )
  );
}

// 앱의 메인페이지
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3;
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  addName(a) {
    setState(() {
      name.add(a);
    });
  }

  addOne() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return DialogUI(addOne : addOne, addName : addName);
          });
        },
      ),
      appBar: AppBar(title: Text(total.toString())),
      body: ListView.builder(
        itemCount: name.length, // 반복 횟수
        itemBuilder: (context, i) { // 함수
          return ListTile(
            leading: Image.asset('assets/icon_profile01.png'),
            title: Text(name[i]),
          );
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne, this.addName}) : super(key: key);
  var addOne;
  var addName;
  var inputData = TextEditingController();
  var inputData2 = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              //onChanged: (text){ inputData2 = text; }, // 사용자가 입력한 값
              controller: inputData,
            ),
            TextButton( child: Text('완료'), onPressed:(){
              addOne();
              //addName(inputData2);
              addName(inputData.text);
              Navigator.pop(context);
            } ), // state.toString()
            TextButton(
                child: Text('취소'),
                onPressed:(){ Navigator.pop(context); })
          ],
        ),
      ),
    );
  }
}