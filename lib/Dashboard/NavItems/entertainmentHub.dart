import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';

class EntertainmentHubScreen extends StatefulWidget {
  @override
  _EntertainmentHubScreenState createState() => _EntertainmentHubScreenState();
}

class _EntertainmentHubScreenState extends State<EntertainmentHubScreen> {
  final List<Map<String, dynamic>> contentList = [
    {
      'profilePic':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg',
      'name': 'John Doe',
      'id': '@johndoe',
      'tag': 'Brainrot',
      'title': 'Amazing AI Generated Image',
      'type': 'image',
      'url':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg',
      'image':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg', // Add image URL for videos
    },
    {
      'profilePic':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg',
      'name': 'John Doe',
      'id': '@johndoe',
      'tag': 'Brainrot',
      'title': 'Amazing AI Generated Video',
      'type': 'video',
      'url':
          'https://vibevision-bucket-pv.s3.amazonaws.com/67b128af769196e663306223_brainrot_1739663665264_video_variation-1.mp4',
      // Add image URL for videos
    },
    {
      'profilePic':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg',
      'name': 'Alice Smith',
      'id': '@alicesmith',
      'tag': 'Jukebox',
      'title': 'AI Composed Music',
      'type': 'music',
      'url':
          'https://vibevision-bucket-pv.s3.amazonaws.com/67af3ba6769196e663305876_jukebox_1739618383112/67af3ba6769196e663305876_jukebox_1739618383112_audio_variation-1.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Entertainment Hub', style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: ListView.builder(
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          final content = contentList[index];
          return ContentCard(content: content);
        },
      ),
    );
  }
}

class ContentCard extends StatefulWidget {
  final Map<String, dynamic> content;
  ContentCard({required this.content});

  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController? _videoController;
  AudioPlayer? _audioPlayer;
  bool isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    if (widget.content['type'] == 'video') {
      _videoController = VideoPlayerController.network(widget.content['url'])
        ..initialize().then((_) {
          setState(() {
            _duration = _videoController!.value.duration;
          });
          _videoController!.addListener(_updateVideoProgress);
        });
    } else {
      _videoController = null;
      _audioPlayer = AudioPlayer();
      _audioPlayer!.onDurationChanged.listen((Duration d) {
        setState(() => _duration = d);
      });
      _audioPlayer!.onPositionChanged.listen((Duration p) {
        setState(() => _position = p);
      });
    }
  }

  void _updateVideoProgress() {
    setState(() {
      _position = _videoController!.value.position;
    });
  }

  @override
  void dispose() {
    _videoController?.removeListener(_updateVideoProgress);
    _videoController?.dispose();
    _audioPlayer?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (widget.content['type'] == 'video' && _videoController != null) {
        if (_videoController!.value.isPlaying) {
          _videoController!.pause();
          isPlaying = false;
          _animationController.stop();
        } else {
          _videoController!.play();
          isPlaying = true;
          _animationController.repeat();
        }
      } else if (widget.content['type'] == 'music' && _audioPlayer != null) {
        if (isPlaying) {
          _audioPlayer!.pause();
          isPlaying = false;
          _animationController.stop();
        } else {
          _audioPlayer!.play(UrlSource(widget.content['url']));
          isPlaying = true;
          _animationController.repeat();
        }
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2A2A40),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage:
                        NetworkImage(widget.content['profilePic'])),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.content['name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(widget.content['id'],
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
                Spacer(),
                Chip(
                  label: Text(widget.content['tag'],
                      style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.blueAccent,
                ),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Text(
                widget.content['title'],
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            if (widget.content['type'] == 'video' && _videoController != null)
              AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_videoController!),
                    if (widget.content['image'] != null)
                      Image.network(
                        widget.content['image'],
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
              ),
            if (widget.content['type'] == 'music')
              Container(
                height: 150, // Increased size for the rotating image
                color: Colors.black12,
                child: Center(
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0)
                        .animate(_animationController),
                    child: CircleAvatar(
                      radius: 50, // Increased size
                      backgroundImage:
                          NetworkImage(widget.content['profilePic']),
                    ),
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white),
                  onPressed: _togglePlayPause,
                ),
                Text(
                  _formatDuration(_position),
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  _formatDuration(_duration),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Slider(
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  if (widget.content['type'] == 'video' &&
                      _videoController != null) {
                    _videoController!.seekTo(Duration(seconds: value.toInt()));
                  } else if (widget.content['type'] == 'music' &&
                      _audioPlayer != null) {
                    _audioPlayer!.seek(Duration(seconds: value.toInt()));
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
