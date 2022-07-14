import 'package:flutter/material.dart';
import 'package:newtest/Future/countButton.dart';

// alt + enter = to wrap with something
// 변수 = 상태, 상태가 있는것 => StatefulWidget
// 커서가 위에 있는 클래스/메서드로 ctrl + B 로 이동할 수 있다.
// ctrl + space 로 입력 가능한 옵션들을 탐색할 수 있다.
// spacer() 라는 것을 SizedBox 와 동일하게 사용가능하다.

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const countButton(),  //MyHomePage
      );
  }
}

// 단축키 : stful
// StatefulWidget : 변수가 있는, 변수 때문에 화면이 바뀔 수 있을 때 사용

class FutureExam4 extends StatefulWidget {
  const FutureExam4({Key? key}) : super(key: key);

  @override
  State<FutureExam4> createState() => _FutureExam4State();
}

class _FutureExam4State extends State<FutureExam4> {
  int countDown = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future exam 4"),
      ),
      body: Center(
        child: Text('$countDown', style: TextStyle(fontSize: 40),),
      ),
    );
  }
}


