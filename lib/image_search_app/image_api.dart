import 'dart:convert';

import 'package:newtest/image_search_app/model_data/json_data.dart';
import 'package:http/http.dart' as http;

class ImageApi {
  Future<List<JsonData>> getJsonFile(String query) async {
    // 외부의 요인 또는 변수/전역변수를 쓰지 않는 = 함수
    // 링크 맨 뒤에 &pretty=true 부분은 불필요해서 삭제
    Uri url = Uri.parse(
        'https://pixabay.com/api/?key=28866788-11de021711810cc8df58d08a2&q=$query&image_type=photo');

    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    Iterable hits = json['hits'];
    List<JsonData> results = hits.map((e) => JsonData.fromJson(e)).toList();
    return results;

    // throw Exception('강제로 에러 발생 테스트'); // 강제로 에러를 발생시킬시에 return 문 대신 사용
    // return []; // data 가 없는 상황을 확인할 때 사용
  }
}
