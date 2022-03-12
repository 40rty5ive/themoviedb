import 'package:flutter/material.dart';

import '../movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('TMDB')),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          Text('Новини'),
          MovieListWidget(),
          Text('Серіали'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Новини',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Фільми',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Серіали',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
