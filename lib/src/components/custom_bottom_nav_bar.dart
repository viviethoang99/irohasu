import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: 1,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
            label: 'Recent',
          )
        ],
      ),
    );
  }
}
