import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Historylecture extends StatefulWidget {
  const Historylecture({super.key});

  @override
  State<Historylecture> createState() => _HistorylectureState();
}

class _HistorylectureState extends State<Historylecture> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM-dd-yyyy HH:mm').format(now);
    String LectureName="Data Communication" ;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            LectureName,style:TextStyle(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(

            padding: EdgeInsets.only(left: 10,right:10,bottom: 10 ),
            child: DataTable(
                showCheckboxColumn: true,
                columnSpacing: 65,
                // Datatable widget that have the property columns and rows.
                columns: const [
                  // Set the name of the column
                  DataColumn(
                    label: Text(' ID'),
                  ),
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(
                    label: Text('Attend?'),
                  ),
                ], rows: [
              // Set the values to the columns
              DataRow(cells: [
                DataCell(Text("20190300")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.check)),
              ]),
              DataRow(cells: [
                DataCell(Text("20190322")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.close,color: Colors.red,)),
              ]),
              DataRow(cells: [
                DataCell(Text("20190308")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.check)),
              ]),
              DataRow(cells: [
                DataCell(Text("20190309")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.check)),
              ]),
              DataRow(cells: [
                DataCell(Text("20190456")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.close,color: Colors.red,)),
              ]),
              DataRow(cells: [
                DataCell(Text("20190355")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.check)),
              ]),
              DataRow(cells: [
                DataCell(Text("20190306")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.close,color: Colors.red,)),
              ]),
              DataRow(cells: [
                DataCell(Text("20190389")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.close,color: Colors.red,)),
              ]),
            ]),
          ),
        ));
  }

  ExpansionTile buildExpansionTile(
      {required String LectureNumber, required bool Attend}) {
    return ExpansionTile(
      title: Text("Lecture " + LectureNumber),
      children: [
        Attend
            ? Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Card(
            elevation: 2,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Text(
                  'You have been  attended The lecture ',
                  style:
                  const TextStyle(fontSize: 22, color: Colors.black),
                ) //,Text(
                //   'At ${DateTime.now()}',
                //   style:
                //   const TextStyle(fontSize: 25, color: Colors.black),
                // ),
              ]),
            ),
          ),
        )
            : Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Card(
            elevation: 2,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Text(
                  'You did not attend the lecture',
                  style:
                  const TextStyle(fontSize: 22, color: Colors.black),
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
