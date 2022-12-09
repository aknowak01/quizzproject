import 'package:flutter/material.dart';
import 'package:quizzproject/widgets/mainscreen.dart';
import 'package:quizzproject/widgets/resultscreen.dart';
import 'package:quizzproject/widgets/testscreen.dart';

class CreatedDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Image.asset('lib/widgets/assets/ic_launcher.png',
                width: 250, height: 250),
          ),
          const ListTile(
            title: Text(
              "Quizz App",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MainScreen(tittle: "Result Screen")),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Result Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const ResultScreen(tittle: "Result Screen")),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Test 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const TestScreen(tittle: "Result Screen")),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Test 2'),
            onTap: () {
              // Tutaj możesz dodać kod, który wykona się po kliknięciu przycisku
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Test 3'),
            onTap: () {
              // Tutaj możesz dodać kod, który wykona się po kliknięciu przycisku
            },
          ),
        ],
      ),
    );
  }
}
