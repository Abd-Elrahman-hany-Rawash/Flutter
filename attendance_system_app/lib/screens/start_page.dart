import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
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
    var Myheight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Myheight,
          color: Colors.teal,
          child: Column(children: [
            Row(
              children: [
                Container(
                  // color: Colors.blue.shade900,
                  height: Myheight * .6,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/StartImage.png",
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            SizedBox(
              height: Myheight * .17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Myheight * .08,
                  child: CustomizedButton(
                    buttonText: "Doctor",
                    textColor: Color.fromRGBO(7, 6, 6, 1),
                    buttonColor: Colors.white70,
                    onPressed: () {
                      SelectScren("Doctor");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Myheight * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Myheight * .08,
                  child: CustomizedButton(
                    buttonText: "Student",
                    textColor: Color.fromRGBO(7, 6, 6, 1),
                    buttonColor: Colors.white70,
                    onPressed: () {
                      SelectScren("Student");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Myheight * .04,
            ),
          ]),
        ),
      ),
    );
  }
}
