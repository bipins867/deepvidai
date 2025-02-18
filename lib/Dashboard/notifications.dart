import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            Text(
              "No new notifications",
              style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
