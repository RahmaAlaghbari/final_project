
import 'package:flutter/material.dart';
import 'Hotels_page.dart';
import 'offer_page.dart';
import '/CustomPages/appbar.dart';
import 'profile_page.dart';

class FooterBar extends StatefulWidget {
  @override
  _FooterBarState createState() => _FooterBarState();
}

class _FooterBarState extends State<FooterBar> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _pages = [
    HotelColumn(),
    OfferPage(),
    ProfilePage(), // ProfilePage added as a page in the PageView
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Drawer Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.business_outlined,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  'Hotels',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  _onNavItemTapped(0);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.local_offer,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  'Offers',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  _onNavItemTapped(1);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  _onNavItemTapped(2); // Adjust the index if needed
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages, // Use the list of pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.business_outlined),
            label: 'Hotels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        elevation: 5,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }
}
