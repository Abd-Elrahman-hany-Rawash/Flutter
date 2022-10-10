import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Lectures History",
          ),
        ),
        body: ListView(
          children: [
            buildExpansionTile(LectureNumber: "1",Attend: false),
            buildExpansionTile(LectureNumber: "2",Attend: true),
            buildExpansionTile(LectureNumber: "3",Attend: true),
            buildExpansionTile(LectureNumber: "4",Attend: true),
            buildExpansionTile(LectureNumber: "5",Attend: false),


          ],
        ));
  }

  ExpansionTile buildExpansionTile({required String LectureNumber, required bool Attend}) {
    return ExpansionTile(
            title: Text("Lecture "+LectureNumber),
            children: [Attend?
              Container(
                padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                child: Card(
                  elevation: 2,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children:[
                        Text(
                          'You have been  attended The lecture ',
                          style:
                          const TextStyle(fontSize: 22, color: Colors.black),
                         )//,Text(
                        //   'At ${DateTime.now()}',
                        //   style:
                        //   const TextStyle(fontSize: 25, color: Colors.black),
                        // ),

                      ]
                    ),
                  ),
                ),
              ):Container(
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Card(
                elevation: 2,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      children:[
                        Text(
                          'You did not attend the lecture'
    ,
                          style:
                          const TextStyle(fontSize: 22, color: Colors.black),
                        ),]
                  ),
                ),
              ),
            )
            ],
          );
  }
}
