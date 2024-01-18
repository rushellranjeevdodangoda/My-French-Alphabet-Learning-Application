import 'package:flutter/material.dart';
import 'letter_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  void handleLetterClick(BuildContext context, String letter) {
    // Navigate to the LetterPage with the selected letter
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LetterPage(letter: letter)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> letters = List.generate(
      26,
      (index) => String.fromCharCode('A'.codeUnitAt(0) + index),
    );

    double letterButtonWidth = 30.0;
    double letterButtonHeight = 30.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabet'),
        backgroundColor: const Color.fromARGB(255, 81, 91, 205),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color.fromARGB(255, 178, 187, 246),
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: letterButtonWidth / letterButtonHeight,
          ),
          itemCount: letters.length,
          itemBuilder: (BuildContext context, int index) {
            String letter = letters[index];

            return ElevatedButton(
              onPressed: () => handleLetterClick(context, letter),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: ['A', 'E', 'I', 'O', 'U'].contains(letter)
                    ? Colors.white
                    : const Color.fromARGB(255, 81, 91, 205),
                foregroundColor: ['A', 'E', 'I', 'O', 'U'].contains(letter)
                    ? Colors.purple
                    : Colors.white,
              ),
              child: Center(
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ['A', 'E', 'I', 'O', 'U'].contains(letter)
                        ? const Color.fromARGB(255, 81, 91, 205)
                        : Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
