import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  void initState() {
    super.initState();
    print('video page init');
  }

  @override
  void dispose() {
    super.dispose();
    print('video page dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('视频'));
  }
}
