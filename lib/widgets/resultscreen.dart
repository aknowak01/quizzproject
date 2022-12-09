import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:quizzproject/widgets/createddrawer.dart';

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
        body: Column(children: [
          (DataTable(
            columns: const [
              DataColumn(label: Text("Nick")),
              DataColumn(label: Text("Points")),
              DataColumn(label: Text("Type")),
              DataColumn(label: Text("Data")),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text("user1")),
                DataCell(Text("10")),
                DataCell(Text("normal")),
                DataCell(Text("2022-12-09")),
              ]),
              DataRow(cells: [
                DataCell(Text("user2")),
                DataCell(Text("20")),
                DataCell(Text("vip")),
                DataCell(Text("2022-12-10")),
              ]),
              DataRow(cells: [
                DataCell(Text("user3")),
                DataCell(Text("15")),
                DataCell(Text("normal")),
                DataCell(Text("2022-12-11")),
              ]),
              DataRow(cells: [
                DataCell(Text("user4")),
                DataCell(Text("25")),
                DataCell(Text("vip")),
                DataCell(Text("2022-12-12")),
              ]),
              DataRow(cells: [
                DataCell(Text("user5")),
                DataCell(Text("5")),
                DataCell(Text("normal")),
                DataCell(Text("2022-12-13")),
              ]),
            ],
          )),
        ]),
        drawer: CreatedDrawer());
  }
}
