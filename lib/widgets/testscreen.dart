import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  final String tittle;
  const TestScreen({super.key, required this.tittle});

  @override
  createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
      ),
      body: Column(

      ),
    );
  }


}