import 'package:flutter/material.dart';

// alt + enter = to wrap with something
// 변수 = 상태, 상태가 있는것 => StatefulWidget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(
        title: "title",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0; //페이지 인덱스

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
          child: Image.asset(
            'assets/youtube.jpg',
          ),
        ),
        title: Text(
          'YouTube',
          style: TextStyle(
            fontSize: 21,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.ondemand_video),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.menu_sharp),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),

      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: Column(
                children: [
                  // Image.network('https://drive.google.com/drive/folders/1a_QKfuCMyyoSGie6e5EQzAY-pvP_ARKy',
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/tving.jpg',
                      width: 180,
                      height: 100,
                      fit: BoxFit.cover, //정해진 사이즈 안에 맞춰 사진을 넣을 때
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/piano.jpg',
                      width: 180,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/war.jpg',
                      width: 180,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/chosun.jpg',
                      width: 180,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              //Expanded 를 설정해줌으로서 글자가 앱화면을 벗어나지 않게 한다.
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        '깊은 감동을 선사했던 서울체크인의 피날레!',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/pink_circle.jpg',
                            width: 20,
                          ),
                        ),
                        Text(
                          '  TVING',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ]),

                    ),
                    Text(
                      '       조회수 9만회 · 1일 전',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        '기분 좋은 하루의 시작! 햇살같은 피아노 곡',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/earth_circle.jpg',
                            width: 20,
                          ),
                        ),
                        Text(
                          '  마인드 피아노',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ]),
                    ),
                    Text(
                      '       조회수 15만회 · 1달 전',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        '우크라 재건회의 "972조 원 필요"...',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/check_circle.jpg',
                            width: 20,
                          ),
                        ),
                        Text(
                          '  KBS News',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ]),
                    ),
                    Text(
                      '       조회수 31만회 · 3일 전',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        '"조선 최고 기와", 갯벌이 지켜낸 보물',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/JTBC.jpg',
                            width: 20,
                          ),
                        ),
                        Text(
                          '  JTBC News',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ]),
                    ),
                    Text(
                      '       조회수 10만회 · 4일 전',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index, //선택된 인덱스
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '이용서비스',
            icon: Icon(Icons.assignment),
          ),
          BottomNavigationBarItem(
            label: '내 정보',
            icon: Icon(Icons.account_circle),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
