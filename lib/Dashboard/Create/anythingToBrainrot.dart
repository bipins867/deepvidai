import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AnythingToBrainrotScreen extends StatefulWidget {
  @override
  _AnythingToBrainrotScreenState createState() =>
      _AnythingToBrainrotScreenState();
}

class _AnythingToBrainrotScreenState extends State<AnythingToBrainrotScreen> {
  String selectedInput = "File";
  String selectedVoice = "Brian - Male, Deep Voice";
  double videoDuration = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title:
            Text('Anything to Brainrot', style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transform boring content into viral-worthy entertainment! Upload anything and watch it become an epic meme masterpiece.',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 16.0),
            Text('Cost: 30 Credits',
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Row(
              children: [
                _buildInputSelection('File'),
                SizedBox(width: 10),
                _buildInputSelection('Text'),
              ],
            ),
            SizedBox(height: 16.0),
            selectedInput == 'File'
                ? ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(LucideIcons.upload),
                    label: Text("Select File"),
                  )
                : TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your text",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(),
                    ),
                  ),
            SizedBox(height: 16.0),
            Text("Select Voice", style: TextStyle(color: Colors.white)),
            DropdownButton<String>(
              value: selectedVoice,
              dropdownColor: Colors.grey[900],
              items: [
                'Brian - Male, Deep Voice',
                'Laura - Female, Upbeat Voice'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedVoice = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text("Video Duration: ${videoDuration.toInt()} sec",
                style: TextStyle(color: Colors.white)),
            Slider(
              value: videoDuration,
              min: 10,
              max: 60,
              activeColor: Colors.blue,
              inactiveColor: Colors.white30,
              onChanged: (newValue) {
                setState(() {
                  videoDuration = newValue;
                });
              },
            ),
            Text("Longer videos allow for more detailed coverage.",
                style: TextStyle(color: Colors.white70)),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Generate Brainrot"),
              ),
            ),
            SizedBox(height: 20.0),
            Text("My Generations",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Center(
              child: Text("Nothing to see here yet",
                  style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSelection(String type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedInput = type;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedInput == type ? Colors.blueAccent : Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(type, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
