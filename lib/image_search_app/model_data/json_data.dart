class JsonData {
  final String previewURL;
  final String tags;

  JsonData({
    required this.previewURL,
    required this.tags,
  });

  factory JsonData.fromJson(Map<String, dynamic> json) {
    return JsonData(
        previewURL: json['previewURL'] as String, //강제 dynamic->String 형변환으로 더 안정
        tags: json['tags'] as String,
    );
  }
}
