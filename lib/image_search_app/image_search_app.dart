import 'dart:convert';

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
  // ? == nullable , null 을 허용하는 타입
  List<JsonData> urls = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future initData() async {
    urls = await getJsonFile();
    setState(() {}); // 화면 갱신 refresh page
  }

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
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
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
            urls.isEmpty
                ? const CircularProgressIndicator()
                : Expanded(
              // 성능의 유리함을 위해 GridView.builder 를 사용했으나,
              // 데이터가 적을때는 builder 를 쓰지 않아도 되어서
              // GridView(children) map().toList() 패턴으로 수정함.

              // 데이터를 위젯으로 변환한 케이스 :
              // 데이터 -> map() 을 사용해서 text 로 변환 -> list 로 변환 -> GridView/ListView

                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      children: urls.map((images) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              images.previewURL,
                              fit: BoxFit.cover,
                            ),
                        );
                      }).toList(),
                    ),
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
    // for (int i = 0; i < hits.length; i ++){
    //   Map<String, dynamic> item = hits[i];
    //   JsonData picture = JsonData.fromJson(item);
    //   results.add(picture);
    // }
    return results;
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}
