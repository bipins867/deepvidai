import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:deepvidai/Utils/theme.dart';

class BikiniBottomNewsScreen extends StatefulWidget {
  @override
  _BikiniBottomNewsScreenState createState() => _BikiniBottomNewsScreenState();
}

class _BikiniBottomNewsScreenState extends State<BikiniBottomNewsScreen> {
  String selectedOption = 'File';
  double videoDuration = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Bikini Bottom News Generator',
            style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transform your media into hilarious underwater news reports!',
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(LucideIcons.creditCard, color: Colors.orange),
                SizedBox(width: 8),
                Text('Credit Cost: 30',
                    style: TextStyle(color: Colors.orange, fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Text('Choose Input Type:',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text('File', style: TextStyle(color: Colors.white)),
                    value: 'File',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() => selectedOption = value.toString());
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text('Text', style: TextStyle(color: Colors.white)),
                    value: 'Text',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() => selectedOption = value.toString());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            selectedOption == 'File'
                ? ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(LucideIcons.upload),
                    label: Text('Select File'),
                  )
                : TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter text here...',
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
            SizedBox(height: 20),
            Text('Video Duration:',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            Slider(
              value: videoDuration,
              min: 10,
              max: 60,
              divisions: 5,
              label: '${videoDuration.toInt()} sec',
              onChanged: (value) {
                setState(() => videoDuration = value);
              },
            ),
            Text('${videoDuration.toInt()} sec',
                style: TextStyle(color: Colors.blueAccent)),
            SizedBox(height: 10),
            Text('Longer videos allow for more detailed news coverage.',
                style: TextStyle(color: Colors.white70)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Generate Bikini Bottom News'),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              ),
            ),
            SizedBox(height: 30),
            Divider(color: Colors.white24),
            SizedBox(height: 10),
            Text('My Generations',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Center(
              child: Text('Nothing to see here yet',
                  style: TextStyle(color: Colors.white70, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
