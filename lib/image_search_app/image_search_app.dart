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
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: urls.length,
                      itemBuilder: (BuildContext context, int index) {
                        JsonData images = urls[index];
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              images.previewURL,
                              fit: BoxFit.cover,
                            ));
                      },
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
