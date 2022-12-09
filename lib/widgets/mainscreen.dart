import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:quizzproject/widgets/createddrawer.dart';
import 'package:quizzproject/widgets/resultscreen.dart';
import 'package:quizzproject/widgets/containerwidget.dart';

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
            child: TextButton(
              child: const Text('Go to Second Screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(tittle: "Result Screen")),
                );
              },
            ),
          ),
          flex: 1,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: ContainerWidget(),
              ),
            ),
          ], //default flex is 2
        ),
        drawer: CreatedDrawer());
  }
}
