import 'dart:js_util';

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
        body: ListView.separated(
          itemCount: 9,
          separatorBuilder: (context, position) {
            return Card(
              elevation: 2,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Lecture ${position + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            );
          },
          itemBuilder: (context, position) {
            if (position == 0) {
              return const SizedBox(width: 0);
            } else {
              return Card(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'You are attended this lecture at ${DateTime.now()}',
                    style: const TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              );
            }
          },
        ));
  }
}
