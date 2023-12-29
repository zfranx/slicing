import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'core.dart';

class ThirdScreen extends StatefulWidget {
  final Function(String) onUserSelected;

  const ThirdScreen({super.key, required this.onUserSelected});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> userList = [];
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url =
        Uri.parse('https://reqres.in/api/users?page=$currentPage&per_page=10');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var users = data['data'] as List;

      setState(() {
        userList.addAll(users.map((user) => User.fromJson(user)).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        centerTitle: true,
      ),
      body: userList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                currentPage++;
                userList.clear();
                await fetchData();
              },
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      widget.onUserSelected(userList[index].fullName);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index].avatar),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userList[index].fullName,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                userList[index].email,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
