import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'examples.dart'; // Import the Examples page

class LetterPage extends StatefulWidget {
  final String letter;

  const LetterPage({Key? key, required this.letter}) : super(key: key);

  @override
  State<LetterPage> createState() => _LetterPageState();
}

class _LetterPageState extends State<LetterPage> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> playAudio() async {
    String audioPath = 'lib/assets/audio/Letter${widget.letter}.mp3';
    await player.setAsset(audioPath);
    await player.play();
  }

  void navigateToExamples(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExamplesPage(letter: widget.letter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.white; // Your old purple color
    Color accentColor = const Color.fromARGB(255, 124, 72, 237);

    double buttonWidth = 150.0; // Set the fixed width for both buttons
    double buttonHeight = 50.0; // Set the fixed height for both buttons

    return Scaffold(
      appBar: AppBar(
        title: Text('Letter ${widget.letter}'),
        backgroundColor: const Color.fromARGB(255, 124, 72, 237),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'lib/assets/images/Menu_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      child: Text(
                        widget.letter,
                        style: const TextStyle(
                          fontSize: 400,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if ('AEIOU'.contains(widget.letter))
                      const Positioned(
                        top: 480,
                        child: Text(
                          '*Vowel',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color:  Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: playAudio,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: accentColor,
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        fixedSize: Size(buttonWidth, buttonHeight),
                      ),
                      icon: const Icon(Icons.play_arrow),
                      label: const Text(
                        'Play Audio',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        navigateToExamples(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: accentColor,
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        fixedSize: Size(buttonWidth, buttonHeight),
                      ),
                      child: const Text(
                        'Examples',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
