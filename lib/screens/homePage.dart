import 'package:custom_bottom_navbar/widgets/bottomTabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _selectedTab = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.teal.shade700),
                  child: const Center(
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.amber.shade700),
                  child: const Center(
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.red.shade800),
                  child: const Center(
                    child: Text(
                      "Notify",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.blue.shade700),
                  child: const Center(
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomTabs(
            selectedTab: _selectedTab,
            tabPressed: (int num) {
              _pageController.animateToPage(num,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic);
            },
          )
        ],
      ),
    );
  }
}
