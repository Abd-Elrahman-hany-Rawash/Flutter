import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorHistory extends StatefulWidget {
  const DoctorHistory({Key? key}) : super(key: key);

  @override
  State<DoctorHistory> createState() => _DoctorHistoryState();
}

class _DoctorHistoryState extends State<DoctorHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("All Lectuers"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            buildCard(context, 'Lecture_1'),
            buildCard(context, 'Lecture_2'),
            buildCard(context, 'Lecture_3'),
            buildCard(context, 'Lecture_4'),
            buildCard(context, 'Lecture_5'),
            buildCard(context, 'Lecture_6'),
          ],
        ),
      ),
    ));
  }

  Card buildCard(BuildContext context, String lecturenumber) {
    return Card(
      elevation: 5,
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity(vertical: 4),
        title: Text(
          lecturenumber,
          style: TextStyle(fontSize: 20),
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              "Historylecture",
            );
          },
          icon: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}
