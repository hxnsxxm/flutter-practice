import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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

  /**
   * 패키지 만든 사람이 정한 사용법
   * Android 11이상 / iOS 환경에선 거절 2번 이상하면 다시는 팝업 안뜸
   * -> 앱 맨 처음 실행시 띄우면 거절을 많이 함
   * -> 그래서 요즘은 앱 실행 시 권한 허락 받지 않음
   * -> 해당 기능(연락처 기능)이 필요할 때 권한 허락을 받음
   */
  getPermission() async {
    var status = await Permission.contacts.status; // 연락처 권한 줬는지 여부, await: 실행을 기다림(Future에 부착 가능)
    if (status.isGranted) {
      print('허락됨');
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request(); // 허락해달라고 팝업 띄우는 코드
      //openAppSettings(); // 앱 설정화면 켜줌 -> 거절 당하면 유저가 앱설정 들어가서 직접 권한을 켜야 함
    }
  }

  /* initState 안에 적은 코드는 위젯 로드될 때 한 번만 실행됨 */
  @override
  void initState() {
    super.initState();
    getPermission();
  }

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
      appBar: AppBar(title: Text(total.toString()), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.contacts))
      ],),
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