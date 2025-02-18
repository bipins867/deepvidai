import 'package:deepvidai/Auth/login.dart';
import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final bool showGetStarted;
  WelcomeScreen({this.showGetStarted = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 120,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/logo-text.png',
                  width: 120,
                ),
                SizedBox(height: 20),
                Text(
                  "Create. Perform. Entertain.",
                  style: AppThemes.darkTheme.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Transform your creative vision into reality with AI-powered music and comedy production.",
                  style: AppThemes.darkTheme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildStatusBox(Icons.people, "Active Users", "50K+"),
                    _buildStatusBox(Icons.visibility, "Daily Visits", "100K+"),
                    _buildStatusBox(
                        Icons.video_collection, "Videos Created", "1M+"),
                    _buildStatusBox(Icons.music_note, "Songs Generated", "2M+"),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  "Powerful Features",
                  style: AppThemes.darkTheme.textTheme.headlineMedium,
                ),
                Text(
                  "Everything you need to create amazing content.",
                  style: AppThemes.darkTheme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    _buildFeature(Icons.bolt, "AI-Powered Creation",
                        "Generate unique content with advanced AI algorithms"),
                    _buildFeature(Icons.star, "Engaging Content",
                        "Generate and view engaging content"),
                    _buildFeature(Icons.high_quality, "Professional Quality",
                        "Industry-standard output for all your content"),
                    _buildFeature(Icons.speed, "Real-time Generation",
                        "Get instant results as you create"),
                    _buildFeature(Icons.download, "Easy Export",
                        "Download your content in multiple formats"),
                    _buildFeature(Icons.feedback, "Community Feedback",
                        "Get insights from other creators"),
                  ],
                ),
                SizedBox(height: 30),
                if (showGetStarted)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text("Get Started"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppThemes.darkTheme.colorScheme.primary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBox(IconData icon, String title, String value) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppThemes.darkTheme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppThemes.darkTheme.colorScheme.primary, size: 30),
          SizedBox(height: 10),
          Text(title, style: AppThemes.darkTheme.textTheme.bodyLarge),
          Text(value, style: AppThemes.darkTheme.textTheme.headlineSmall),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String description) {
    return ListTile(
      leading:
          Icon(icon, color: AppThemes.darkTheme.colorScheme.primary, size: 30),
      title: Text(title, style: AppThemes.darkTheme.textTheme.titleMedium),
      subtitle:
          Text(description, style: AppThemes.darkTheme.textTheme.bodyMedium),
    );
  }
}
