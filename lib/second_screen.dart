import 'package:flutter/material.dart';

import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String name;

  const SecondScreen(this.name, {super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          const Text(
            'Welcome,',
            style: TextStyle(
              color: Color(0xFF04021D),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0.25,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 13.0),
          Text(
            widget.name,
            style: const TextStyle(
              color: Color(0xFF04021D),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0.11,
            ),
            textAlign: TextAlign.left,
          ),
          const Divider(
            height: 20,
            color: Colors.black,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selected Username',
                  style: TextStyle(
                    color: Color(0xFF04021D),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.06,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  selectedUserName,
                  style: const TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdScreen(
                      onUserSelected: (userName) {
                        setState(() {
                          selectedUserName = userName;
                        });
                      },
                    ),
                  ),
                );
              },
              child: const Text('Choose a User'),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
