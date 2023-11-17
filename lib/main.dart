import 'package:flutter/material.dart';
import 'package:flutter_application_1/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.network(
            'https://reading-time.co.kr/themes/readingtime/img/header-logo.png',
            width: 150.0, // Kích thước hình ảnh bên trái theo ý muốn
            height: 150.0,
          ),
          onPressed: () {
            // Xử lý sự kiện khi nhấn vào hình ảnh bên trái
          },
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.menu), // Thay 'your_icon' bằng icon mong muốn
            onPressed: () {
              // Xử lý sự kiện khi nhấn vào icon bên phải
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(child: ImageSlider()),
      ),
      floatingActionButton: SizedBox(
        width: 200.0, // Đặt chiều rộng tùy ý
        height: 100.0, // Đặt chiều dài tùy ý
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          onPressed: _incrementCounter,
          child: Image.network(
            'https://cf.channel.io/pub-file/57620/6188da855b34dcdcda11/icon-modifed.png',
            width: 200.0, // Kích thước hình ảnh theo ý muốn
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
