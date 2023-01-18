import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResultScreen extends StatefulWidget {
  final String tittle;

  const ResultScreen({super.key, required this.tittle});

  @override
  createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<List<User>> usersFuture = getUsers();

  static Future<List<User>> getUsers() async {
    const url = 'http://tgryl.pl/quiz/results';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<User>(User.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Ranking'),
        ),
        body: Center(
          child: FutureBuilder<List<User>>(
            future: usersFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final users = snapshot.data!;
                return buildUsers(users);
              } else {
                return const Text('No user data.');
              }
            },
          ),
        ));
  }

  Widget buildUsers(List<User> users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          child: ListTile(
            leading: Text(user.nick),
            title: Text(user.type),
            subtitle: Text("${user.score}     ${user.type}"),
          ),
        );
      });
}

class User {
  final String nick;
  final int score;
  final int total;
  final String type;

  const User(
      {required this.nick,
      required this.score,
      required this.total,
      required this.type});

  static User fromJson(json) => User(
        nick: json['nick'],
        score: json['score'],
        total: json['total'],
        type: json['type'],
      );
}
