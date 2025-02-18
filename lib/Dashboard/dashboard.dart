import 'package:deepvidai/Dashboard/NavItems/create.dart';
import 'package:deepvidai/Dashboard/NavItems/discoverMusic.dart';
import 'package:deepvidai/Dashboard/NavItems/entertainmentHub.dart';
import 'package:deepvidai/Dashboard/NavItems/home.dart';
import 'package:deepvidai/Dashboard/NavItems/profile.dart';
import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    HomeScreen(),
    EntertainmentHubScreen(),
    DiscoverMusicScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo.png'),
          ),
        ),
        title: Image.asset(
          'assets/logo-text.png',
          height: 24,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(
                  'Credit: 80',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(LucideIcons.bell, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      // Use BottomAppBar to create a notch for the FAB
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1E1E2C), // Match the BottomNavigationBar color
        shape: CircularNotchedRectangle(), // Creates a notch for the FAB
        notchMargin: 8.0, // Adjust the margin of the notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(LucideIcons.home,
                  color:
                      _selectedIndex == 0 ? Color(0xFF0A84FF) : Colors.white70),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(LucideIcons.tv,
                  color:
                      _selectedIndex == 1 ? Color(0xFF0A84FF) : Colors.white70),
              onPressed: () => _onItemTapped(1),
            ),
            SizedBox(width: 48), // Space for the FAB
            IconButton(
              icon: Icon(LucideIcons.music,
                  color:
                      _selectedIndex == 2 ? Color(0xFF0A84FF) : Colors.white70),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(LucideIcons.user,
                  color:
                      _selectedIndex == 3 ? Color(0xFF0A84FF) : Colors.white70),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateScreen(),
            ),
          );
        },
        backgroundColor: Color(0xFF0A84FF),
        child: Icon(LucideIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Positions the FAB in the notch
    );
  }
}
