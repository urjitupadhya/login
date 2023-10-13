import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _activeTab = 0; // Set the initially active tab
  List<String> _tabs = ['Trending', 'Explore', 'Saved', 'Profile']; // Define your tab names

  void onPageChanged(int index) {
    setState(() {
      _activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomBar(),
      body: Center(
        child: Text('Content for ${_tabs[_activeTab]}'), // Display content based on the active tab
      ),
    );
  }

  Widget buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _activeTab,
      onTap: onPageChanged,
      items: _tabs.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(Icons.home), // You can use different icons for each tab
          label: tab,
        );
      }).toList(),
    );
  }
}
