import 'package:fakestore/view/home/home_page.dart';
import 'package:fakestore/view/screens/admin_panel.dart';
import 'package:fakestore/view/screens/carts_page.dart';
import 'package:flutter/material.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  final List<Widget> _pages = [const HomePage(), const CartsPage(),const AdminPanelPage()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar( 
          onTap: _onTap,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: "")
          ]),
    );
  }

  void _onTap(int value) {
    setState(() => currentIndex = value);
  }
}
