import 'dart:convert';

import 'package:flutter/material.dart';

class JsonPrac extends StatefulWidget {
  const JsonPrac({Key? key}) : super(key: key);

  @override
  State<JsonPrac> createState() => _JsonPracState();
}

class _JsonPracState extends State<JsonPrac> {
  Map<String,dynamic>? user; //Map<String,dynamic> user = {};
  // ? == nullable , null 을 허용하는 타입
  @override
  void initState(){
    super.initState();
    initData();
  }

  Future initData() async {
    user = await getData(); //Map<String, dynamic> user = await getData();
    setState((){ }); // 화면 갱신 refresh page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON 연습 시작'),
      ),
      body: Center(
        child: user == null
          ? const CircularProgressIndicator() // null 일때 리턴
          : Text(
          user.toString(), // null 이 아니면 리턴할 내용 // '이름 ${person!['name']}',
          style: TextStyle(fontSize: 30),),
      )
    );
  }

  Future<Map<String, dynamic>> getData() async {
    await Future.delayed(const Duration(seconds: 2));

    String jsonString = '{ "name": "홍길동", "email":"aaa@aaa.com"}';

    Map<String,dynamic> jsonMap = jsonDecode(jsonString);  //jsonCode 의 리턴타입은 dynamic 이다.
    return jsonMap;
  }
}
