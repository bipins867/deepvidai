import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ImageCraftStudioScreen extends StatefulWidget {
  @override
  _ImageCraftStudioScreenState createState() => _ImageCraftStudioScreenState();
}

class _ImageCraftStudioScreenState extends State<ImageCraftStudioScreen> {
  String selectedStyle = 'Realistic';
  String selectedColorScheme = 'Vibrant & Colorful';
  String selectedPurpose = 'Custom Project';

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('ImageCraft Studio', style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yo! Ready to level up your pics? Drop your ideas and watch our AI magic turn them into absolute. No cap, just pure vibes and endless possibilities!',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 10),
              Text(
                'AI-Powered Creative Fast',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Create Your Vibe',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Describe your image',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Color(0xFF2A2A40),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Pro Tips No Cap',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(LucideIcons.palette, color: Colors.white),
                title: Text('Go crazy with them colors and vibes',
                    style: TextStyle(color: Colors.white70)),
              ),
              ListTile(
                leading: Icon(LucideIcons.image, color: Colors.white),
                title: Text('Drop that mood and aesthetic',
                    style: TextStyle(color: Colors.white70)),
              ),
              ListTile(
                leading: Icon(LucideIcons.camera, color: Colors.white),
                title: Text('Tell us how you want it shot tho',
                    style: TextStyle(color: Colors.white70)),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: selectedStyle,
                dropdownColor: Color(0xFF2A2A40),
                items: ['Realistic', 'Cartoon'].map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child:
                        Text(category, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedStyle = newValue as String;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Style',
                    labelStyle: TextStyle(color: Colors.white70)),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: selectedColorScheme,
                dropdownColor: Color(0xFF2A2A40),
                items: ['Vibrant & Colorful', 'Muted & Subtle']
                    .map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child:
                        Text(category, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedColorScheme = newValue as String;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Color Scheme',
                    labelStyle: TextStyle(color: Colors.white70)),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: selectedPurpose,
                dropdownColor: Color(0xFF2A2A40),
                items: ['Custom Project', 'Digital Art'].map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child:
                        Text(category, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedPurpose = newValue as String;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Purpose',
                    labelStyle: TextStyle(color: Colors.white70)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Generate Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'My Generation',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Nothing to see here yet',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
