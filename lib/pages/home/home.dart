import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    print('home page init');
  }

  @override
  void dispose() {
    super.dispose();
    print('home page dispose');
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: _controller,
      child: ListView(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail',
                    arguments: {"pid": 456});
              },
              icon: Icon(Icons.add))
        ],
      ),
      onRefresh: () async {
        print('refresh ---');
      },
      onLoad: () async {},
    );
  }

  @override
  bool get wantKeepAlive => true;
}
