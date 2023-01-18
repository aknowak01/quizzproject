import 'package:flutter/material.dart';
import 'package:quizzproject/widgets/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: ' '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => checkFirstRun(context));
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Regulamin'),
          content: const Text('Treść regulaminu'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Akceptuję'),
              onPressed: () {
                _acceptTerms();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Nie akceptuję'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _acceptTerms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('terms_accepted', true);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(tittle: widget.title);
  }
  Future checkFirstRun(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

    if (isFirstRun) {
      _showTermsDialog();
      prefs.setBool('isFirstRun', false);
    } else {
      return null;
    }
  }
}
