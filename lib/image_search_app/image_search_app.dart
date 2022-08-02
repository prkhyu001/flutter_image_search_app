import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:newtest/image_search_app/model_data/json_data.dart';
import 'package:newtest/image_search_app/model_data/json_file.dart';
// import 'model_data/json_data.dart' as my_data;

class ImageSearchApp extends StatefulWidget {
  const ImageSearchApp({Key? key}) : super(key: key);

  @override
  State<ImageSearchApp> createState() => _ImageSearchAppState();
}

class _ImageSearchAppState extends State<ImageSearchApp> {
  final TextEditingController _textController = TextEditingController();
  String _query = '';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Image Search App',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                // onSubmitted: _handleSubmitted,
                // onChanged: (text){}, 사용시에는 검색 클릭 전에 입력에 따라 계속해서 화면을 변경, 검색
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black12, width: 2),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // print("검색 ${_textController.text}"); // 클릭이 잘 되는지 run 하고 console에서 확인
                        setState(() {
                          _query = _textController.text;
                        });
                      },
                      child: const Icon(Icons.search),
                    ),
                    hintText: "검색어를 입력하세요",
                    hintStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),

            // FutureBuilder :
            // API 콜을 해서 응답을 받기 전까지는 로딩 위젯를 보여주고,
            // 성공 응답을 받으면 데이터를 보여주는 위젯을 보여주고,
            // 실패 응답을 받으면 에러메세지를 보여주는 위젯을 보여주고 싶을때 쓰는 위젯입니다.

            FutureBuilder<List<JsonData>>(
              future: getJsonFile(_query),
              builder: (context, snapshot) {
                // snapshot : 상태 등의 future 에 대한 여러가지 정보를 가지는 객체
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("에러가 발생했습니다."), // 화면에 에러 status code 가 아닌, 지정한 메세지를 보여줌
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // null check 의 용도로 사용 가능. 데이터가 0개도, 데이터가 있는 것이다.
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("데이터가 없습니다."),
                  );
                }

                final images =
                    snapshot.data!; // 위에서 데이터가 있음을 확인했으니, non-nullable 변수임을 보증

                if (images.isEmpty) {
                  return const Center(
                    child: Text("데이터가 0개 입니다."),
                  );
                }

                return Expanded(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children:
                        images.where((e) => e.tags.contains(_query))
                            .map((JsonData images) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          images.previewURL,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ));
  }

  // 아래는 외부의 요인 또는 변수/전역변수를 쓰지 않는, 함수이다.

  Future<List<JsonData>> getJsonFile(String query) async {
    // await Future.delayed(const Duration(seconds: 2)); // 데이터를 가져오기전에 2초 기다리도록 설계

    // 링크 맨 뒤에 &pretty=true 부분은 불필요해서 삭제
    Uri url = Uri.parse('https://pixabay.com/api/?key=28866788-11de021711810cc8df58d08a2&q=$query&image_type=photo');

    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    String jsonString = response.body;

    // String jsonString = images;
    Map<String, dynamic> json = jsonDecode(jsonString);
    Iterable hits = json['hits'];
    List<JsonData> results = hits.map((e) => JsonData.fromJson(e)).toList();
    return results;

    // throw Exception('강제로 에러 발생 테스트'); // 강제로 에러를 발생시킬시에 return 문 대신 사용
    // return []; // data 가 없는 상황을 확인할 때 사용
  }
}
