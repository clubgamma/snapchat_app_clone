import 'package:flutter/material.dart';
import 'package:snapchat_clone_main/Chats/chats.dart';
import 'package:snapchat_clone_main/DiscoveryPage/discovery.dart';
import 'package:snapchat_clone_main/Map/map.dart';
import 'package:snapchat_clone_main/Reels/reels.dart';
import 'package:snapchat_clone_main/StoriesPage/stories.dart';
import '../CameraPage/camera.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: _getColor()),
        unselectedIconTheme: const IconThemeData(color: Colors.white60),
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _page,
        onTap: (index) {
          this._c.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOutSine);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
            ),
            label: 'camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'stories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow_outlined),
            label: 'discovery',
          ),
        ],
      ),
      body: PageView(
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            _page = newPage;
          });
        },
        children: <Widget>[
          MapPage(),
          Chats(),
          CameraPage(),
          Stories(),
          ReelsPage(),
        ],
      ),
    );
  }

  Color _getColor() {
    switch (_page) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.teal;
      case 4:
        return Colors.red;
      default:
        return Colors.red;
    }
  }
}
