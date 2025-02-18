import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DeepVid AI",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Empowering creators with AI-driven music and comedy production.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What We Offer",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildFeature(
                      "AI-Powered Content Generation",
                      "Create unique music, videos, and images using cutting-edge AI algorithms.",
                    ),
                    _buildFeature(
                      "Real-Time Generation & Professional Output",
                      "Generate high-quality content instantly with AI-driven precision.",
                    ),
                    _buildFeature(
                      "Community Engagement",
                      "Explore and interact with user-generated content and receive community feedback.",
                    ),
                    _buildFeature(
                      "AI-Driven Content Strategy",
                      "Leverage AI tools for content curation and effective content planning.",
                    ),
                  ],
                ),
              ),
            ),
            // Add a Spacer to push the button to the bottom
            Spacer(),
            // Add the "Explore More" button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your navigation or action here
                  print("Explore More button pressed!");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Explore More",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add some spacing at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
