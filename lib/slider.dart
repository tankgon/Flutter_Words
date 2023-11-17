import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  List<ImageData> _imageDataList = [];

  @override
  void initState() {
    super.initState();
    _loadImageData();
  }

  void _loadImageData() {
    // Đọc dữ liệu JSON từ tệp hoặc API
    String jsonData = '''
  [
    {"imageUrl": "https://reading-time.co.kr/resources/img/main/vis1.jpg"},
    {"imageUrl": "https://reading-time.co.kr/resources/img/main/vis2.jpg"},
    {"imageUrl": "https://reading-time.co.kr/resources/img/main/vis3.jpg"}
  ]
''';

    List<dynamic> jsonList = json.decode(jsonData);
    _imageDataList = jsonList.map((item) => ImageData.fromJson(item)).toList();
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imageDataList.length;
    });
  }

  void _previousImage() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _imageDataList.length) % _imageDataList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(150.0),
            bottomRight: Radius.circular(150.0),
          ),
          child: Image.network(
            _imageDataList[_currentIndex].imageUrl,
            width: 400.0,
            height: 260.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: _previousImage,
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: _nextImage,
            ),
          ],
        ),
      ],
    );
  }
}
