import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewStudentCourse extends StatefulWidget {
  const NewStudentCourse({super.key});

  @override
  State<NewStudentCourse> createState() => _NewStudentCourse();
}

SubjectCard() {
  return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color.fromARGB(255, 120, 236, 91),
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        '202101.FCI.CS251 ',
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'مقدمة هندسة البرمجيات',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          color: Color(0xFF080808),
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'د. هبه حمدى على',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    color: Color(0xFF000102),
                    fontSize: 25,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.05, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'enroll',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF02070E),
                            fontSize: 25,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.05, 0.15),
                          child: IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.plusCircle,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]));
}

class _NewStudentCourse extends State<NewStudentCourse> {
  @override
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('All Courses');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: customSearchBar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'type in journal name...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(),
    );
  }
}
