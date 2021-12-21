import 'package:flutter/material.dart';
import 'package:flutter_itis/modules/instagram/account.dart';
import 'package:flutter_itis/modules/instagram/pages/actions.dart';
import 'package:flutter_itis/modules/instagram/pages/home.dart';
import 'package:flutter_itis/modules/instagram/pages/reels.dart';
import 'package:flutter_itis/modules/instagram/pages/search.dart';
import 'package:styled_widget/styled_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomNavBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    UserSearch(),
    UserReels(),
    UserActions(),
    UserAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomNavBar,
        type: BottomNavigationBarType.fixed,
        iconSize: 27.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black,), activeIcon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined, color: Colors.black,), activeIcon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call_outlined, color: Colors.black,), activeIcon: Icon(Icons.video_call), label: 'reels'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline, color: Colors.black,), activeIcon: Icon(Icons.favorite), label: 'actions'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity_outlined, color: Colors.black,), activeIcon: Icon(Icons.person), label: 'account')
        ],
      ),
    );
  }
}
