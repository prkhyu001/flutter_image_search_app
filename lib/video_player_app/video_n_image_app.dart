import 'package:flutter/material.dart';
import 'package:newtest/image_search_app/image_search_app.dart';
import 'package:newtest/video_player_app/video_search_app.dart';

class VideoNImageApp extends StatefulWidget {
  const VideoNImageApp({Key? key}) : super(key: key);

  @override
  State<VideoNImageApp> createState() => _VideoNImageAppState();
}

class _VideoNImageAppState extends State<VideoNImageApp> {
  int _currentIndex = 0;

  final screens = const [
    ImageSearchApp(),
    VideoSearchApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.image), label : 'image'),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label : 'video'),
        ],
      ),
    );
  }
}
