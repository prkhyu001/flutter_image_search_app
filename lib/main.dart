import 'package:flutter/material.dart';
import 'package:newtest/future_grammar//count_button.dart';
import 'package:newtest/JSON_practice/json_prac1.dart';

import 'image_search_app/image_search_app.dart';
import 'image_search_app/video_search_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const VideoSearchApp(),  // JsonPrac(), countButton(), ImageSearchApp()
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
        title: const Text("future_grammar exam 4"),
      ),
      body: Center(
        child: Text('$countDown', style: TextStyle(fontSize: 40),),
      ),
    );
  }
}

// Object 조상님 클래스 연습
class Person extends Object {
  void getName(){}
}
// == (항상 extends Object 가 있지만, 겉으론 생략되어있음)
class Person2 {
  void getName(){}
}
// 외부에서 아래와 같이 인스턴스를 생성하고, Object 모든 클래스의 부모클래스의 메서드 사용 가능
// Person person = Person();
// person.toString()