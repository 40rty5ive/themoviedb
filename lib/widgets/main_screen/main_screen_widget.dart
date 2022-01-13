// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Новини'
    ),
    MovieListWidget(),
    Text(
      'Серіали'
    ),
  ];

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
        title: Center(child: Text('TMDB')),
      ),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
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
