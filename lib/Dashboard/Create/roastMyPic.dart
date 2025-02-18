import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class RoastMyPicScreen extends StatefulWidget {
  @override
  _RoastMyPicScreenState createState() => _RoastMyPicScreenState();
}

class _RoastMyPicScreenState extends State<RoastMyPicScreen> {
  double _duration = 10;
  String? _selectedVoice;
  PlatformFile? _selectedFile;

  final List<String> voices = [
    "Brian - Male, American, Deep Voice",
    "Laura - Female, American, Upbeat Voice",
  ];

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'png', 'webp', 'svg', 'gif', 'bmp'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Roast My Pic', style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tired of everyone talking good about you? Let our AI roast you with style and savage humor!',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 16),
            Text('Cost: 30 Credits',
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Upload Image (Max 10MB)',
                style: TextStyle(color: Colors.white)),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text(
                  _selectedFile == null ? 'Select File' : _selectedFile!.name),
            ),
            SizedBox(height: 16),
            Text('Select Voice:', style: TextStyle(color: Colors.white)),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.grey[900],
              value: _selectedVoice,
              hint:
                  Text('Choose Voice', style: TextStyle(color: Colors.white70)),
              items: voices.map((voice) {
                return DropdownMenuItem(
                  value: voice,
                  child: Text(voice, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedVoice = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Video Duration (10s - 60s)',
                style: TextStyle(color: Colors.white)),
            Slider(
              value: _duration,
              min: 10,
              max: 60,
              divisions: 5,
              label: "${_duration.toInt()} sec",
              onChanged: (value) {
                setState(() {
                  _duration = value;
                });
              },
            ),
            Text('Longer videos allow for more detailed roasts.',
                style: TextStyle(color: Colors.white70, fontSize: 12)),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Generate Roast Video'),
              ),
            ),
            SizedBox(height: 16),
            Text('My Generations',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Center(
              child: Text('Nothing to see here yet',
                  style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}
