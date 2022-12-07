import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class MainScreen extends StatefulWidget {
  final String tittle;

  const MainScreen({super.key, required this.tittle});

  @override
  createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: FooterView(
        footer: Footer(
          padding: const EdgeInsets.all(10.0),
          child: const Text('Result button'),
        ),
        flex: 1,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: Center(
              child: Text('Test List'),
            ),
          ),
        ], //default flex is 2
      ),
      drawer: Footer(
        child: const Text('footer'),
      ),
    );
  }
}
