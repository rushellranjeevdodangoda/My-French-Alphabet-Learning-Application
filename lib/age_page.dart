// age_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

class AgePage extends StatefulWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  DateTime? _selectedDate; // Store the selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Verification'),
        backgroundColor: const Color.fromARGB(255, 81, 91, 205),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Added image above the age selection box
            Image.asset(
              'lib/assets/images/Lock.png',  // Replace with the actual path to your image
              height: 150,  // Adjust the height as needed
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 128, 138, 206), // Adjusted color to be a bit darker
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    _selectedDate != null
                        ? 'Age: ${DateTime.now().difference(_selectedDate!).inDays ~/ 365}'
                        : 'Enter Your Birth Date Here',
                    style: const TextStyle(fontSize: 18, color: Colors.white), // Set text color to white
                  ),
                  onTap: () {
                    _showAgePicker(context);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedDate != null) {
                  int age = DateTime.now().difference(_selectedDate!).inDays ~/ 365;

                  if (age >= 5) {
                    // Navigate to MenuPage if age is 5 or more
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuPage()),
                    );
                  } else {
                    // Show a message or take appropriate action
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Age Restriction'),
                          content: const Text('Sorry, you must be 5 or older to proceed.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  // Show a message or take appropriate action for not selecting age
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Age Not Selected'),
                        content: const Text('Please select your age.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF515BCD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Adjusted padding
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 22, color: Colors.white), // White text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the age picker
  Future<void> _showAgePicker(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            },
          ),
        );
      },
    );
  }
}
