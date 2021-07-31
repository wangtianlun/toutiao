import 'package:flutter/material.dart';
import './home.dart';
import './video.dart';
import './play.dart';
import './user.dart';

class HomeIndexPage extends StatefulWidget {
  const HomeIndexPage({Key? key}) : super(key: key);

  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  int _selectedBarIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _pageList = <Widget>[
    HomePage(),
    VideoPage(),
    PlayPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('123')),
      body: PageView(
        controller: _pageController,
        children: this._pageList,
        onPageChanged: (index) {
          setState(() {
            _selectedBarIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '头条'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '视频'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '放映厅'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '我的'),
        ],
        currentIndex: _selectedBarIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectedBarIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
