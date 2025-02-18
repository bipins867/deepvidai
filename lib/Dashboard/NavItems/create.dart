import 'package:deepvidai/Dashboard/Create/aiMotion.dart';
import 'package:deepvidai/Dashboard/Create/anythingToBrainrot.dart';
import 'package:deepvidai/Dashboard/Create/bikiniBottomNews.dart';
import 'package:deepvidai/Dashboard/Create/imageCraftStudio.dart';
import 'package:deepvidai/Dashboard/Create/jukeboxAi.dart';
import 'package:deepvidai/Dashboard/Create/roastMyPic.dart';
import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CreateScreen extends StatelessWidget {
  // Define the tools list without using 'context' directly
  final List<Map<String, dynamic>> tools = [
    {
      'title': 'Bikini Bottom News',
      'description':
          'Transform your PDF, Document or Images into hilarious underwater news reports!',
      'type': 'Video',
      'icon': LucideIcons.fileText,
      'function': (BuildContext context) {
        print("Bikini Bottom News tapped!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BikiniBottomNewsScreen(),
          ),
        );
      },
    },
    {
      'title': 'Roast My Pic!',
      'description': 'Tell Deepvid AI to roast an Image you submit!',
      'type': 'Video',
      'icon': LucideIcons.image,
      'function': (BuildContext context) {
        print("Roast My Pic tapped!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoastMyPicScreen(),
          ),
        );
      },
    },
    {
      'title': 'Anything To Brainrot',
      'description':
          'Turn any boring file into an epic, meme-worthy learning experience!',
      'type': 'Video',
      'icon': LucideIcons.brain,
      'function': (BuildContext context) {
        print("Anything To Brainrot tapped!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnythingToBrainrotScreen(),
          ),
        );
      },
    },
    {
      'title': 'AI Motion',
      'description':
          'Generate videos from images by describing desired actions',
      'type': 'Video',
      'icon': LucideIcons.playCircle,
      'function': (BuildContext context) {
        print("AI Motion tapped!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AiMotionScreen(),
          ),
        );
      },
    },
    {
      'title': 'Image Craft Studio',
      'description': 'Create stunning AI-generated images from descriptions',
      'type': 'Image',
      'icon': LucideIcons.paintbrush,
      'function': (BuildContext context) {
        print("Image Craft Studio tapped!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageCraftStudioScreen(),
          ),
        );
      },
    },
    {
      'title': 'Jukebox',
      'description':
          'Create unique AI-powered music compositions with advanced controls and customization',
      'type': 'Music',
      'icon': LucideIcons.music,
      'function': (BuildContext context) {
        print("Jukebox tapped!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JukeboxAiScreen(),
          ),
        );
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title:
            Text("Deepvid's AI Tools", style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ai_motion_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Introducing AI Motion",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                          "Generate videos with text prompt or images using AI.",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AiMotionScreen(),
                            ),
                          );
                        },
                        child: Text("Explore"),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ai_motion_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Featuring Jukebox",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                          "Create tracks that resonate with your style and vision using AI.",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JukeboxAiScreen(),
                            ),
                          );
                        },
                        child: Text("Explore"),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  final tool = tools[index];
                  return GestureDetector(
                    onTap: () => tool['function'](context), // Pass context here
                    child: Card(
                      color: Color(0xFF2A2A40),
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Icon(tool['icon'], color: Colors.white),
                        title: Text(tool['title'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Text(tool['description'],
                                style: TextStyle(color: Colors.white70)),
                            SizedBox(height: 4),
                            Text(tool['type'],
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
