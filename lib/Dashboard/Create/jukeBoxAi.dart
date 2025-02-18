import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';

class JukeboxAiScreen extends StatefulWidget {
  @override
  _JukeboxAiScreenState createState() => _JukeboxAiScreenState();
}

class _JukeboxAiScreenState extends State<JukeboxAiScreen> {
  bool isCustomMode = false;
  bool isInstrumental = false;
  TextEditingController songDescriptionController = TextEditingController();
  TextEditingController lyricsController = TextEditingController();
  TextEditingController styleController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  final List<String> simpleSuggestions = [
    "A smooth jazz saxophone melody for a cozy rainy afternoon",
    "An energetic rock anthem about living life to the fullest",
    "A heartfelt R&B ballad about healing after heartbreak",
    "A catchy summer pop hit with tropical beach vibes",
    "An orchestral piece inspired by a mountain sunrise",
  ];

  final List<String> customSuggestions = ["Metal", "Jazz Fusion"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Jukebox AI', style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Unique AI-powered music compositions with advanced controls and customization',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title:
                    Text('Custom Mode', style: TextStyle(color: Colors.white)),
                value: isCustomMode,
                onChanged: (value) {
                  setState(() {
                    isCustomMode = value;
                  });
                },
              ),
              SizedBox(height: 10),
              if (!isCustomMode) ...[
                TextField(
                  controller: songDescriptionController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Song Description",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SwitchListTile(
                  title: Text('Instrumental',
                      style: TextStyle(color: Colors.white)),
                  value: isInstrumental,
                  onChanged: (value) {
                    setState(() {
                      isInstrumental = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Generate Music'),
                ),
                SizedBox(height: 16),
                Text('Try these suggestions:',
                    style: TextStyle(color: Colors.white70)),
                Wrap(
                  children: simpleSuggestions.map((suggestion) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          songDescriptionController.text = suggestion;
                        });
                      },
                      child: Chip(
                        label: Text(suggestion,
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }).toList(),
                ),
              ] else ...[
                TextField(
                  controller: lyricsController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Lyrics",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                SwitchListTile(
                  title: Text('Instrumental',
                      style: TextStyle(color: Colors.white)),
                  value: isInstrumental,
                  onChanged: (value) {
                    setState(() {
                      isInstrumental = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: styleController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Style of Music",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  children: customSuggestions.map((suggestion) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          styleController.text +=
                              (styleController.text.isNotEmpty ? ', ' : '') +
                                  suggestion;
                        });
                      },
                      child: Chip(
                        label: Text(suggestion,
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: titleController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Generate Music'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
