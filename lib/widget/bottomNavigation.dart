import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:frontend/screen/home.dart';
import 'package:frontend/screen/menu.dart';
import 'package:frontend/screen/ingredients.dart';

class GoogleBottomBar extends StatefulWidget {
  const GoogleBottomBar({super.key});

  @override
  State<GoogleBottomBar> createState() => _GoogleBottomBarState();
}

class _GoogleBottomBarState extends State<GoogleBottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _screenOptions = [
    HomePage(),
    IngredientsPage(),
    MenuPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: SalomonBottomBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        onTap: _onItemTapped,
        items: _navBarItems,
      ),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("홈"),
    selectedColor: Colors.green,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.list),
    title: const Text("재료"),
    selectedColor: Colors.green,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.fastfood_outlined),
    title: const Text("레시피"),
    selectedColor: Colors.green,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.chat),
    title: const Text("커뮤니티"),
    selectedColor: Colors.green,
  ),
];
