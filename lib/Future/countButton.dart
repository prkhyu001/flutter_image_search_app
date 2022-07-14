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
            // exam1();
            exam2().then((value) => print(value));
          },
          child: Text('연습1'),
        ),
      ),
    );
  }

  // 3초 후에 프린트 되는 함수
  Future<void> exam1() async {
    var delay = Future.delayed(const Duration(seconds: 3));
    delay.then((value) => print("Hello!"));
  }

  // String 을 리턴해주는 함수
  // exam1() 함수와 똑같이 동작 but better option than exam1()

  Future<String> exam2() async {
    await Future.delayed(const Duration(seconds: 3));
    return "3 seconds passed, Hello!";
    // // (coding style used less frequently nowadays)
    // var sentence = await Future.value("3 seconds passed, Hello!");
    // return sentence;
  }
}
