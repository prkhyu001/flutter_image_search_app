import 'package:flutter/material.dart';

class countButton extends StatelessWidget {
  const countButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button 을 이용한 Future 연습'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('시작!');
            exam1();
          },
          child: Text('연습1'),
        ),
      ),
    );
  }

  // 3초 후에 프린트 되는 함수
  Future<void> exam1() async {
    var delay = Future.delayed(Duration(seconds: 3));
    delay.then((value) => print("Hello!"));
  }
}
