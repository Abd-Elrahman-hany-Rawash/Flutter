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
            buildExpansionTile(),
            buildExpansionTile(),
            buildExpansionTile(),
            buildExpansionTile(),

          ],
        ));
  }

  ExpansionTile buildExpansionTile() {
    return ExpansionTile(
            title: Text("lecture 1"),
            children: [
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
                          'You have been  attended This lecture ',
                          style:
                          const TextStyle(fontSize: 22, color: Colors.black),
                        ),Text(
                          'At ${DateTime.now()}',
                          style:
                          const TextStyle(fontSize: 25, color: Colors.black),
                        ),]
                    ),
                  ),
                ),
              )
            ],
          );
  }
}
