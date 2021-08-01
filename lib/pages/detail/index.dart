import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map arguments;

  const DetailPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情页')),
      body: Container(),
    );
  }
}
