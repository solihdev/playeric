import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    await player.setSource(AssetSource("assets/mp3/konsta.mp3"));
  }

  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF0B0B0B),
      appBar: AppBar(
        title: const Text("Audio Page"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (isPlaying) {
                  player.pause();
                } else {
                  player.play(AssetSource("assets/mp3/konsta.mp3"));
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            ),
            const SizedBox(width: 50),
            IconButton(
              onPressed: () {
                setState(() {
                  isPlaying = false;
                });
              },
              icon: const Icon(Icons.stop, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
