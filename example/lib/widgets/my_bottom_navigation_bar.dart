import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:figma_to_flutter/figma_to_flutter.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> paths = [
      "main.png",
      "like.png",
      "chat.png",
      "settings.png"
    ];
    return FigmaContainer(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFF8F8F8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            for (int i = 0; i < paths.length; i++)
              BottomNavigationBarItem(
                label: '',
                icon: FigmaContainer(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == _selectedIndex
                          ? const Color(0xFFEB5757)
                          : Colors.transparent),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/${paths[i]}",
                    width: Figma.of(context).px(24, Axis.horizontal),
                    color: i == _selectedIndex
                        ? Colors.white
                        : const Color(0xFF414141),
                  ),
                ),
              ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
