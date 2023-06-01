import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.purple,
    Colors.blue,
    Colors.pinkAccent,
    Colors.indigo,
  ];
  static void play(int index) {
    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.play(AssetSource("note${index + 1}.wav"));
  }

  List<SoundWidget> items = List.generate(
    7,
    (index) => SoundWidget(
      onTap: () {
        play(index);
      },
      color: colors[index],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sound Game"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, children: items),
    );
  }
}

class SoundWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  const SoundWidget({Key? key, required this.onTap, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
