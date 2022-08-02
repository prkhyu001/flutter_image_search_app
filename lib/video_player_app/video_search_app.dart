import 'package:flutter/material.dart';
import 'package:newtest/image_search_app/model_data/json_data.dart';
import 'package:newtest/video_player_app/video_api.dart';
import 'package:newtest/video_player_app/video_player.dart';

class VideoSearchApp extends StatefulWidget {
  const VideoSearchApp({Key? key}) : super(key: key);

  @override
  State<VideoSearchApp> createState() => _VideoSearchAppState();
}

class _VideoSearchAppState extends State<VideoSearchApp> {
  final _videoApi = VideoApi();
  final TextEditingController _textController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    // 자원을 반환하기 위해 컨트롤러를 dispose 한다.
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Video Search App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
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

            // VideoPlayerController가 초기화를 진행하는 동안 로딩 스피너를 보여주기 위해 FutureBuilder를 사용
            FutureBuilder<List<VideoData>>(
                future: _videoApi.getVideos(_query),
                builder: (context, snapshot) {
                  // snapshot : 상태 등의 future 에 대한 여러가지 정보를 가지는 객체
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                          "에러가 발생했습니다."), // 화면에 에러 status code 가 아닌, 지정한 메세지를 보여줌
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

                  final videos = snapshot
                      .data!; // 위에서 데이터가 있음을 확인했으니, non-nullable 변수임을 보증

                  if (videos.isEmpty) {
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
                      children: videos
                          .where((e) => e.tags.contains(_query))
                          .map((VideoData videos) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoApp(videos.videos['medium']['url'])),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://i.vimeocdn.com/video/${videos.pictureId}_${videos.thumbnailSize}.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
