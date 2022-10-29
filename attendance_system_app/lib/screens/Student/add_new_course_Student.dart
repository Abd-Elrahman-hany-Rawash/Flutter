import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewStudentCourse extends StatefulWidget {
  const NewStudentCourse({super.key});

  @override
  State<NewStudentCourse> createState() => _NewStudentCourse();
}

class _NewStudentCourse extends State<NewStudentCourse> {
  @override
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('All Courses');

  Widget build(BuildContext context) {
    cards(ctx, subjectCode, subjectName, doctorName) {
      return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color.fromARGB(255, 35, 229, 112),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "${subjectCode}",
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "${subjectName}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      color: Color(0xFF080808),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${doctorName}",
              style: const TextStyle(
                fontFamily: 'Urbanist',
                color: Color(0xFF000102),
                fontSize: 25,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.05, 0),
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
                          setState(() {
                            showModalBottomSheet(
                                context: ctx,
                                builder: (builder) {
                                  return Container(
                                    height: 200.0,
                                    color: Colors.white,
                                    child: Column(children: [
                                      const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text(" Access Code ",
                                            //textScaleFactor: 2,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            )),
                                      ),
                                      const TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText:
                                              'Enter the access code of the subject',
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 15, 0, 0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.amber),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            'Submit ',
                                            style: TextStyle(
                                              fontSize: 27,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  );
                                });
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    SubjectCard(ctx) {
      return ListView(scrollDirection: Axis.vertical, children: [
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
            child: Container(
              child: Column(children: [
                // subjectCode, subjectName, doctorName
                cards(ctx, "202101.FCI.CS251", "مقدمة في هندسة البرمجيات",
                    "د. هبه حمدى على"),
                cards(
                    ctx,
                    "212202.FCI.IT331",
                    "Data Communication (IT331 and IT221)",
                    "د./ايمان السيد سند محمد"),
                cards(ctx, "212202.FCI.CS214", "Data Structures",
                    "د./محمد محمود فوزى"),
              ]),
            )),
      ]);
    }

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
                          hintText: 'Search about subjects...',
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
        body: Container(
          child: SubjectCard(context),
        ));
  }
}
