import 'package:flutter/material.dart';
import 'pages/home/homeImage.dart';
import 'pages/myImg/myImage.dart';
import 'pages/mime/mine.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {

  MainPage({Key key}) : super(key: key);

  @override
  _MainPage createState() => _MainPage();

}

class _MainPage extends State<MainPage> {
  
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      label: "家庭相册",    
    ),

    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.image),
      label: "个人相册",    
    ),

    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.person),
      label: "我的",    
    ),
  ];

  int currentIndex;

  final pages = [
    HomeImage(),
    MyImage(),
    Mine()
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('相册APP'),backgroundColor: Colors.deepPurple[600],),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  // 切换页面
  void _changePage(int index) {
    if(index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

}
