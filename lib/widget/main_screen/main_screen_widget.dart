import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kinoapp/theme/app_colors.dart';
import 'package:kinoapp/widget/movie_list/movie_list.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget>[];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TMDB')),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text('News'),
          MovieListWidget(),
          // Text('Films'),
          Text('Serials'),
        ],
      ),
      // Center(
      //   child: _widgetOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: AppColors.mainDarkBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onSelectTab,
        // unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Films'),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Serials',
          ),
        ],
      ),
    );
  }
}
