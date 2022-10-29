import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
                    label: Text('Lecture'),
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
                DataCell(Text("Lecture_1")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.check)),
              ]),
              DataRow(cells: [
                DataCell(Text("Lecture 2")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.close,color: Colors.red,)),
              ]),
              DataRow(cells: [
                DataCell(Text("Lecture 3")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.check)),
              ]),
              DataRow(cells: [
                DataCell(Text("Lecture 4")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.check)),
              ]),
              DataRow(cells: [
                DataCell(Text("Lecture 5")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.close,color: Colors.red,)),
              ]),
              DataRow(cells: [
                DataCell(Text("Lecture 6")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.check)),
              ]),
              DataRow(cells: [
                DataCell(Text("Lecture 7")),
                DataCell(Text(formattedDate)),
                DataCell(Icon(Icons.close,color: Colors.red,)),
              ]),
              DataRow(cells: [
                DataCell(Text("Lecture 8")),
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
