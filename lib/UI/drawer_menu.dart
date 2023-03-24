import 'dart:ui';

import 'package:app_1/UI/login_view.dart';
import 'package:app_1/UI/profile.dart';
import 'package:app_1/UI/search.dart';
import 'package:app_1/UI/setting.dart';
import 'package:flutter/material.dart';

class drawer_menu extends StatefulWidget {
  const drawer_menu({super.key});

  @override
  State<drawer_menu> createState() => _drawer_menuState();
}

class _drawer_menuState extends State<drawer_menu> {
  final List<Widget> _menuOption = [
    profile(),
    search(),
    setting(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Page"),
      ),
      body: _menuOption[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Image.network(
                    'https://th.bing.com/th/id/R.6c63c3fa80a5869538bad8a4cbd327c6?rik=QcMS%2bzbMELu5KA&pid=ImgRaw&r=0',
                    width: 70,
                    height: 70,
                  ),
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text("Username", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home Page"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return drawer_menu();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Account"),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("My Lists"),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: new BorderSide(
                        color: Color.fromARGB(255, 207, 207, 207))),
              ),
              child: ListTile(
                leading: Icon(Icons.save),
                title: Text("Wishlist"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Contact"),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: new BorderSide(
                        color: Color.fromARGB(255, 207, 207, 207))),
              ),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("Info & FAQ"),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: new BorderSide(
                        color: Color.fromARGB(255, 207, 207, 207))),
              ),
              child: ListTile(
                leading: Icon(Icons.lock_open),
                title: Text("Logout"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return login_view();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
