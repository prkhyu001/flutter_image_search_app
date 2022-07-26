import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newtest/image_search_app/model_data/json_data.dart';
import 'package:newtest/image_search_app/model_data/json_file.dart';
// import 'model_data/json_data.dart' as my_data;

class ImageSearchApp extends StatelessWidget {
  const ImageSearchApp({Key? key}) : super(key: key);

  // final TextEditingController _textController = TextEditingController();

  // 상태가 없어서 StatelessWidget 으로 변경
  // FutureBuilder 를 만들면서 불필요한 부분 지움

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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                // controller: _textController,
                // onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black12, width: 2),
                    ),
                    suffixIcon: Icon(Icons.search),
                    hintText: "검색어를 입력하세요",
                    hintStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),

            // FutureBuilder :
            // API 콜을 해서 응답을 받기 전까지는 로딩 위젯를 보여주고,
            // 성공 응답을 받으면 데이터를 보여주는 위젯을 보여주고,
            // 실패 응답을 받으면 에러메세지를 보여주는 위젯을 보여주고 싶을때 쓰는 위젯입니다.

            FutureBuilder<List<JsonData>>(
              future: getJsonFile(),
              builder: (context, snapshot) {
                // snapshot : 상태 등의 future 에 대한 여러가지 정보를 가지는 객체
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("에러가 발생했습니다."),
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
                      childAspectRatio: 1 / 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children: images.map((images) {
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

  Future<List<JsonData>> getJsonFile() async {
    await Future.delayed(const Duration(seconds: 2));
    String jsonString = images;
    Map<String, dynamic> json = jsonDecode(jsonString);
    Iterable hits = json['hits'];
    List<JsonData> results = hits.map((e) => JsonData.fromJson(e)).toList();
    return results;

    // throw Exception('강제로 에러 발생 테스트'); // 강제로 에러를 발생시킬시에 return 문 대신 사용
    // return []; // data 가 없는 상황을 확인할 때 사용
  }

// void _handleSubmitted(String text) {
//   _textController.clear();
// }
}
