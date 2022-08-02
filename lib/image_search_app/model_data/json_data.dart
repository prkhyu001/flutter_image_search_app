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


class VideoData {
  // final String videoURL;
  // final String thumbnail;
  final String tags;
  final String pictureId;
  final String thumbnailSize = '256x166';
  final Map<String, dynamic> videos;

  VideoData({
    // required this.videoURL,
    // required this.thumbnail,
    required this.tags,
    required this.pictureId,
    required this.videos,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      // videoURL: json['videos']['tiny']['url'] as String,
      // thumbnail: 'https://i.vimeocdn.com/video/${pictureId}_295x166.jpg',
      tags: json['tags'] as String,
      pictureId: json['picture_id'] as String,
      videos: json['videos'] as Map<String, dynamic>,
    );
  }
}