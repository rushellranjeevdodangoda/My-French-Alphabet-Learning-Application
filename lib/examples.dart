import 'package:flutter/material.dart';

class ExamplesPage extends StatelessWidget {
  final String letter;

  ExamplesPage({Key? key, required this.letter}) : super(key: key);

  // Map to store French words and their English meanings
  final Map<String, Map<String, String>> frenchWords = {
    'A': {'word': 'Avion', 'meaning': 'Airplane'},
    'B': {'word': 'Banane', 'meaning': 'Banana'},
    'C': {'word': 'Chat', 'meaning': 'Cat'},
    'D': {'word': 'Dent', 'meaning': 'Tooth'},
    'E': {'word': 'Éléphant', 'meaning': 'Elephant'},
    'F': {'word': 'Fleur', 'meaning': 'Flower'},
    'G': {'word': 'Girafe', 'meaning': 'Giraffe'},
    'H': {'word': 'Horloge', 'meaning': 'Clock'},
    'I': {'word': 'Insecte', 'meaning': 'Insect'},
    'J': {'word': 'Jouet', 'meaning': 'Toy'},
    'K': {'word': 'Kangourou', 'meaning': 'Kangaroo'},
    'L': {'word': 'Lion', 'meaning': 'Lion'},
    'M': {'word': 'Montagne', 'meaning': 'Mountain'},
    'N': {'word': 'Nuage', 'meaning': 'Cloud'},
    'O': {'word': 'Oiseau', 'meaning': 'Bird'},
    'P': {'word': 'Papillon', 'meaning': 'Butterfly'},
    'Q': {'word': 'Quatre', 'meaning': 'Four'},
    'R': {'word': 'Renard', 'meaning': 'Fox'},
    'S': {'word': 'Soleil', 'meaning': 'Sun'},
    'T': {'word': 'Tortue', 'meaning': 'Turtle'},
    'U': {'word': 'Umbrella', 'meaning': 'Umbrella'},
    'V': {'word': 'Vache', 'meaning': 'Cow'},
    'W': {'word': 'Wagon', 'meaning': 'Wagon'},
    'X': {'word': 'Xylophone', 'meaning': 'Xylophone'},
    'Y': {'word': 'Yogurt', 'meaning': 'Yogurt'},
    'Z': {'word': 'Zèbre', 'meaning': 'Zebra'},
  };

  @override
  Widget build(BuildContext context) {
// Your old purple color
    Color accentColor = Colors.white;

    // Extract French word and its English meaning from the map
    Map<String, String> wordsMap = frenchWords[letter] ??
        {'word': 'Word Not Found', 'meaning': 'Meaning Not Found'};
    String frenchWord = wordsMap['word']!;
    String englishMeaning = wordsMap['meaning']!;

    // Build the image path dynamically
    String imagePath = 'lib/assets/images/example_images/example_$letter.png';

    return Scaffold(
      appBar: AppBar(
        title: Text('Examples for Letter $letter'),
        backgroundColor: Color.fromARGB(255, 124, 72, 237),
        foregroundColor: accentColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'French Word Starting From Letter $letter:',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/French_Flag.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 5),
                Text(
                  frenchWord,
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Show the dynamically loaded image with increased size
            Image.asset(
              imagePath,
              width: 350, // Adjust the width as needed
              height: 350, // Adjust the height as needed
            ),
            const SizedBox(height: 20),
            const Text(
              'English Meaning:',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/UK_Flag.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 5),
                Text(
                  englishMeaning,
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
