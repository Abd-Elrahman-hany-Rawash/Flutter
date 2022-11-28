import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewStudentCourse extends StatefulWidget {
  const NewStudentCourse({super.key});

  @override
  State<NewStudentCourse> createState() => _NewStudentCourse();
}

class _NewStudentCourse extends State<NewStudentCourse> {
  diaglog() {
    return {
      showDialog(
          context: context,
          builder: (BuildContext) {
            return Alert();
          })
    };
  }

  Alert() {
    return Expanded(
      child: AlertDialog(
        title: const Text(
          'Select lecture',
          style: TextStyle(fontSize: 25),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height / 7,
          child: Column(children: [
            Divider(
              color: Colors.black,
            ),
            Text(
              overflow: TextOverflow.fade,
              maxLines: null,
              softWrap: true,
              'Do you want to choose previous lectures or current lecture ?',
              style: TextStyle(fontSize: 19),
            ),
          ]),
        ),
        actions: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
              child: const Text("Previous lectures"),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  "History",
                );
              },
            ),
            const TextButton(
              onPressed: null,
              //     () {
              //   Navigator.of(context).pushNamed(
              //     "Doctor",
              //   );
              // },
              child: Text("Current lecture"),
            )
          ]),
        ],
      ),
    );
  }

  @override
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('All Courses');

  Widget build(BuildContext context) {
    cards(ctx, subjectName, subjectCode) {
      return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 10),
                child: Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          "$subjectName",
                          textAlign: TextAlign.start,
                          //textScaleFactor: 0.85,
                          maxLines: null,
                          softWrap: true,
                          overflow: TextOverflow.fade,

                          style: const TextStyle(
                            fontFamily: 'Urbanist',
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "$subjectCode",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  color: Color(0xFF000102),
                  fontSize: 19.5,
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
        ),
      );
    }

    // AlertDialog()

    SubjectCard(ctx) {
      return ListView(scrollDirection: Axis.vertical, children: [
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Container(
              child: Column(children: [
                // subjectCode, subjectName, doctorName
                cards(ctx, "Computer Archtecture", "IT311"),
                cards(ctx, "Communication Technology", "IT321"),
                cards(ctx, "Data Structures", "Cs341"),
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
