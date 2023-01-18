import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final Widget drawer;
  final String title;
  
  const AppLayout({
    required this.child,
    required this.drawer,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}