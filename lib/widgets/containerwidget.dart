import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({
    super.key,
  });

  @override
  createState() => _ContainerWidget();
}

class _ContainerWidget extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: const [
                  Text("Tytuł 1"),
                  Text("Treść 1"),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: const [
                  Text("Tytuł 2"),
                  Text("Treść 2"),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: const [
                  Text("Tytuł 3"),
                  Text("Treść 3"),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: const [
                  Text("Tytuł 4"),
                  Text("Treść 4"),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: const [
                  Text("Tytuł 5"),
                  Text("Treść 5"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
