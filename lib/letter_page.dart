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

  // Updated function to navigate to the Examples page
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
    Color primaryColor = const Color.fromARGB(255, 81, 91, 205); // Your old purple color
    Color accentColor = Colors.white;

    double buttonWidth = 150.0; // Set the fixed width for both buttons
    double buttonHeight = 50.0; // Set the fixed height for both buttons

    return Scaffold(
      appBar: AppBar(
        title: Text('Letter ${widget.letter}'),
        backgroundColor: primaryColor,
        foregroundColor: accentColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use a Stack to position the letter and "*Vowel" text
            Stack(
              alignment: Alignment.topCenter,
              children: [
                // Display the relevant letter in a large font
                Positioned(
                  child: Text(
                    widget.letter,
                    style: TextStyle(
                      fontSize: 400,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Display "*Vowel" text below the letter
                if ('AEIOU'.contains(widget.letter))
                  Positioned(
                    top: 480, // Adjust the top position as needed
                    child: Text(
                      '*Vowel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 30), // Reduce spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: playAudio,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: accentColor, backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    fixedSize: Size(buttonWidth, buttonHeight), // Set the fixed size
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
                const SizedBox(width: 10), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    navigateToExamples(context); // Call the updated function
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: accentColor,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    fixedSize: Size(buttonWidth, buttonHeight), // Set the fixed size
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
    );
  }
}
