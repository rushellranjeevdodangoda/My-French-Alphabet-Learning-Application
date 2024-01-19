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
        backgroundColor: Color.fromARGB(255, 124, 72, 237),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/AgeVerify.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center elements vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 205, 5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      _selectedDate != null
                          ? 'Age: ${DateTime.now().difference(_selectedDate!).inDays ~/ 365}'
                          : 'Enter Your Birth Date Here',
                      style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 89, 89, 91)),
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuPage()),
                      );
                    } else {
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
                  backgroundColor: const Color.fromARGB(255, 131, 44, 253),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
