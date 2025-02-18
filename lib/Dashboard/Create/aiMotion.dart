import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';

class AiMotionScreen extends StatefulWidget {
  @override
  _AiMotionScreenState createState() => _AiMotionScreenState();
}

class _AiMotionScreenState extends State<AiMotionScreen> {
  bool isFileSelected = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('AI Motion', style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mandatory Text Input
            Text(
              'Describe Your Idea *',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _textController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter text description...',
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),

            // Optional File Upload
            Text(
              'Upload Image (Optional)',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Simulate file selection
                setState(() {
                  isFileSelected = true;
                });
              },
              child: Text(isFileSelected ? 'Change File' : 'Select File'),
            ),
            SizedBox(height: 20.0),

            // Generate Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_textController.text.isEmpty) {
                    // Show error if text input is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a text description.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Proceed with generation
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Generating AI Motion Video...'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    // Add your logic for generating the video here
                  }
                },
                child: Text('Generate AI Motion Video'),
              ),
            ),
            SizedBox(height: 30.0),

            // My Generations Section
            Text(
              'My Generations',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Nothing to see here yet',
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
