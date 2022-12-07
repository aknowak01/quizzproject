import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class ResultScreen extends StatefulWidget {
  final String tittle;
  const ResultScreen({super.key, required this.tittle});

  @override
  createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
      ),
      body: Column(

      ),
      drawer: Footer(
        child: const Text('footer'),

      ),




    );
  }


}