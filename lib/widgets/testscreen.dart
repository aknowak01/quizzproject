import 'package:flutter/material.dart';
import 'package:quizzproject/widgets/createddrawer.dart';

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
         children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Tytuł"),
                  SizedBox(height: 16.0),
                  Text("Treść"),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () { /* obsługa kliknięcia pierwszego przycisku */ },
                        child: Text("Przycisk 1"),
                      ),
                      SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () { /* obsługa kliknięcia drugiego przycisku */ },
                        child: Text("Przycisk 2"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]
      ),
      drawer: CreatedDrawer(),
    );
  }
}
