import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newtest/image_search_app/model_data/json_data.dart';
import 'model_data/json_data.dart' as my_data;

import 'package:newtest/image_search_app/model_data/json_file.dart';

class ImageSearchApp extends StatefulWidget {
  const ImageSearchApp({Key? key}) : super(key: key);

  @override
  State<ImageSearchApp> createState() => _ImageSearchAppState();
}

class _ImageSearchAppState extends State<ImageSearchApp> {
  // ? == nullable , null 을 허용하는 타입
  List<my_data.JsonData> jsonUrls = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future initData() async {
    jsonUrls = await getJsonFile();
    setState(() {}); // 화면 갱신 refresh page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Search'),
        ),
        body: Center(
          // child: user == null
          //   ? const CircularProgressIndicator() // null 일때 리턴
          //   : Text(
          //   user.toString(), // null 이 아니면 리턴할 내용 // '이름 ${person!['name']}',
          //   style: TextStyle(fontSize: 30),),
          child: Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: jsonUrls.length,
              // ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                JsonData images = jsonUrls[index];
                return Image.network(images.previewURL);
              },
            ),
          ),
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
}


