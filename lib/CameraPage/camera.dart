import 'package:flutter/material.dart';
import 'package:snapchat_clone_main/Memories/memories.dart';
import 'package:snapchat_clone_main/SearchPage/search.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  int _page = 1;
  late PageController _c;

  @override
  void initState() {
    _c = PageController(
      keepPage: true,
      initialPage: _page,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
    );
  }
}
