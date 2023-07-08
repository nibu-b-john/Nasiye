import 'package:flutter/material.dart';
import 'package:nasiye/Screens/discover.dart';
import 'package:nasiye/Screens/help.dart';
import 'package:nasiye/Screens/my_rtb.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  yNavigatiate createState() => yNavigatiate();
}

class yNavigatiate extends State<NavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    DiscoverScreen(
      subscribed: true,
    ),
    const MyRBT(),
    const HelpScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
              ),
              label: 'My RTB',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.help_outline_outlined,
              ),
              label: 'Help',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: color.onPrimary,
          selectedIconTheme: IconThemeData(color: color.onPrimary),
          iconSize: 18,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
