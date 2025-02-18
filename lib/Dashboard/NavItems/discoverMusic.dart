import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DiscoverMusicScreen extends StatefulWidget {
  @override
  _DiscoverMusicScreenState createState() => _DiscoverMusicScreenState();
}

class _DiscoverMusicScreenState extends State<DiscoverMusicScreen> {
  final List<Map<String, dynamic>> musicList = [
    {
      'image':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg',
      'title': 'Lofi Chill',
      'type': 'Lofi, Chill',
      'userPic':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg',
      'username': 'John Doe',
      'duration': '04:00',
      'url':
          'https://vibevision-bucket-pv.s3.amazonaws.com/67af3ba6769196e663305876_jukebox_1739618383112/67af3ba6769196e663305876_jukebox_1739618383112_audio_variation-1.mp3'
    },
    {
      'image':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg',
      'title': 'Sad Piano',
      'type': 'Piano, Sad',
      'userPic':
          'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg',
      'username': 'Alice Smith',
      'duration': '03:45',
      'url':
          'https://vibevision-bucket-pv.s3.amazonaws.com/67af3ba6769196e663305876_jukebox_1739618383112/67af3ba6769196e663305876_jukebox_1739618383112_audio_variation-1.mp3'
    },
  ];

  AudioPlayer _audioPlayer = AudioPlayer();
  String? _playingUrl;
  bool isPlaying = false;
  double progress = 0.0;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  void _playMusic(String url) async {
    if (_playingUrl == url && isPlaying) {
      await _audioPlayer.pause();
      setState(() => isPlaying = false);
    } else {
      if (_playingUrl != url) {
        await _audioPlayer.stop(); // Stop the currently playing track
        await _audioPlayer.play(UrlSource(url));
      } else {
        await _audioPlayer.resume();
      }
      setState(() {
        _playingUrl = url;
        isPlaying = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => totalDuration = duration);
    });
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
        progress = totalDuration.inSeconds > 0
            ? position.inSeconds / totalDuration.inSeconds
            : 0;
      });
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        _playingUrl = null;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Discover Music', style: TextStyle(color: Colors.white)),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (context, index) {
                final music = musicList[index];
                final isCurrentlyPlaying = _playingUrl == music['url'];

                return Card(
                  color: Color(0xFF2A2A40),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        Image.network(music['image'],
                            width: 60, height: 60, fit: BoxFit.cover),
                        if (isCurrentlyPlaying)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        Positioned.fill(
                          child: IconButton(
                            icon: Icon(
                              isCurrentlyPlaying && isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () => _playMusic(music['url']),
                          ),
                        ),
                      ],
                    ),
                    title: Text(music['title'],
                        style: TextStyle(color: Colors.white)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(music['type'],
                            style: TextStyle(color: Colors.grey)),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(music['userPic']),
                              radius: 12,
                            ),
                            SizedBox(width: 8),
                            Text(music['username'],
                                style: TextStyle(color: Colors.white)),
                            Spacer(),
                            Text(music['duration'],
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (_playingUrl != null)
            Container(
              color: Color(0xFF1E1E2C),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        musicList.firstWhere(
                            (m) => m['url'] == _playingUrl)['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            musicList.firstWhere(
                                (m) => m['url'] == _playingUrl)['title'],
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            musicList.firstWhere(
                                (m) => m['url'] == _playingUrl)['username'],
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause_circle : Icons.play_circle,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () => _playMusic(_playingUrl!),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Slider(
                    value: progress,
                    onChanged: (value) {
                      final newPosition = Duration(
                          seconds: (value * totalDuration.inSeconds).toInt());
                      _audioPlayer.seek(newPosition);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(currentPosition),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          _formatDuration(totalDuration),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
