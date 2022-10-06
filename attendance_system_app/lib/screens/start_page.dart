import 'package:flutter/material.dart';

import '../widget/CustomizedButton.dart';

class Start_Page extends StatefulWidget {
  const Start_Page({Key? key}) : super(key: key);

  @override
  State<Start_Page> createState() => _Start_PageState();
}

class _Start_PageState extends State<Start_Page> {
  void SelectScren(String Pagename) {
    if (Pagename == "Student") {
      Navigator.of(context).pushNamed(
        "student",
      );
    } else {
      Navigator.of(context).pushNamed("Doctor");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          child: Column(children: [
            Row(
              children: [
                Container(
                  // color: Colors.blue.shade900,
                  height: MediaQuery.of(context).size.height / 1.35,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/4.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),

            // SizedBox(height: 20, ),
            Row(
              children: [
                CustomizedButton(
                  buttonText: "Student",
                  textColor: Colors.white,
                  buttonColor: Colors.black,
                  onPressed: () {
                    SelectScren("Student");
                  },
                ),
              ],
            ),
            Row(
              children: [
                CustomizedButton(
                  buttonText: "Doctor",
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                  onPressed: () {
                    SelectScren("Doctor");
                  },
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
