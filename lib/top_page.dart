import 'package:floating_searchbar_example/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _MyTopPageState();
}

class _MyTopPageState extends State<TopPage> {
  int currentIndex = 0;
  final List<String> _tabNames = [
    "フィード",
    "アプリ",
    "学習",
    "予定",
    "マイページ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _topPageBody(context),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.access_time),
              label: _tabNames[0],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.apps),
              label: _tabNames[1],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.import_contacts),
              label: _tabNames[2],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.date_range),
              label: _tabNames[3],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: _tabNames[4],
            ),
          ],
        ));
  }

  Widget? _topPageBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _tabPage(
          currentIndex,
          0,
          Container(
            color: Colors.redAccent,
          ),
        ),
        _tabPage(
          currentIndex,
          1,
          Container(
            color: Colors.black,
          ),
        ),
        _tabPage(
          currentIndex,
          2,
          const SearchPage(),
        ),
        _tabPage(
          currentIndex,
          3,
          Container(
            color: Colors.green,
          ),
        ),
        _tabPage(
          currentIndex,
          4,
          Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _tabPage(int currentIndex, int tabIndex, Widget page) {
    return Visibility(
      visible: currentIndex == tabIndex,
      maintainState: true,
      child: page,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
