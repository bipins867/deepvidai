import 'package:deepvidai/Dashboard/NavItems/entertainmentHub.dart';
import 'package:deepvidai/Profile/aboutUs.dart';
import 'package:deepvidai/Profile/billingAndSubscription.dart';
import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'John Doe',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '@johndoe',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Passionate content creator and music enthusiast.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.mapPin, color: Colors.white70, size: 18),
                SizedBox(width: 5),
                Text(
                  'New York, USA',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildNavItem(
                      context, LucideIcons.creditCard, 'Billing & Subscription',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BillingSubscriptionScreen(),
                      ),
                    );
                  }),
                  _buildNavItem(context, LucideIcons.video, 'My Creations', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EntertainmentHubScreen(),
                      ),
                    );
                  }),
                  _buildNavItem(
                      context, LucideIcons.users, 'Refer and Earn', () {}),
                  _buildNavItem(
                      context, LucideIcons.helpCircle, 'Help Center', () {}),
                  _buildNavItem(context, LucideIcons.info, 'About Us', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUsScreen(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Card(
      color: Color(0xFF2A2A40),
      child: ListTile(
        leading: Icon(icon, color: Colors.white70),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: Icon(LucideIcons.chevronRight, color: Colors.white70),
        onTap: onTap,
      ),
    );
  }
}
