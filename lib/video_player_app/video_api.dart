import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newtest/image_search_app/model_data/json_data.dart';

class VideoApi {
  Future<List<VideoData>> getVideos(String query) async {
    Uri url = Uri.parse(
        'https://pixabay.com/api/videos/?key=28866788-11de021711810cc8df58d08a2&q=$query');

    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    Iterable hits = json['hits'];
    return hits.map((e) => VideoData.fromJson(e)).toList();
  }
}