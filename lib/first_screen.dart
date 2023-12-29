import 'package:flutter/material.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: sentenceController,
              decoration: const InputDecoration(
                labelText: 'Sentence',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = isPalindrome(sentenceController.text)
                      ? 'isPalindrome'
                      : 'not palindrome';
                });
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(result),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Choose your preferred color
              ),
              child: const Text('Check'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(nameController.text),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Choose your preferred color
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  bool isPalindrome(String text) {
    String cleanText = text.replaceAll(' ', '').toLowerCase();
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }
}
