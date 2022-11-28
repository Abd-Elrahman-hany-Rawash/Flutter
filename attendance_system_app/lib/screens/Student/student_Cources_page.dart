import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StudentCources extends StatefulWidget {
  const StudentCources({Key? key}) : super(key: key);

  @override
  _StudentCourcesState createState() => _StudentCourcesState();
}

class _StudentCourcesState extends State<StudentCources>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController CourceName = TextEditingController();
    TextEditingController CourceCode = TextEditingController();
    double _w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("Registerd Courses"),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed('NewStudentCourse');
                  })
            ]),

        body: ListView(
          // physics:
          // BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     searchBar(),
            //   ],
            // ),
            // SizedBox(height: _w / 20),

            Row(children: [
              buildCard(
                CourceName: "Data Structure",
                ImageUrl: 'assets/images/DataStructure.png',
                CourceCode: "Fcai2021IT",
                DoctorName: " Besheer",
                // RouteName:  showAlert(context)
              ),
              buildCard(
                CourceName: "Data Communication",
                ImageUrl: 'assets/images/Datacommunnication.png',
                CourceCode: "Fcai2021IT",
                DoctorName: "Iman Sanad",
                //  RouteName: showAlert(context)
              ),
            ]),
            Row(children: [
              buildCard(
                CourceName: "Advanced SoftWare ",
                ImageUrl: 'assets/images/Datacommunnication.png',
                CourceCode: "Fcai2021IT",
                DoctorName: "Iman Sanad",
                //RouteName: showAlert(context)
              ),
              buildCard(
                CourceName: "Data Communication",
                ImageUrl: 'assets/images/Datacommunnication.png',
                CourceCode: "Fcai2021IT",
                DoctorName: "Iman Sanad",
                //RouteName: showAlert(context)
              ),
            ]),
            Row(children: [
              buildCard(
                CourceName: "Data Communication",
                ImageUrl: 'assets/images/Datacommunnication.png',
                CourceCode: "Fcai2021IT",
                DoctorName: "Iman Sanad",
                //RouteName: showAlert(context)
              ),
              buildCard(
                CourceName: "Data Communication",
                ImageUrl: 'assets/images/Datacommunnication.png',
                CourceCode: "Fcai2021IT",
                DoctorName: "Iman Sanad",
                //RouteName: showAlert(context)
              ),
            ]),
            Row(children: [
              buildCard(
                CourceName: "Data Communication",
                ImageUrl: 'assets/images/Datacommunnication.png',
                CourceCode: "Fcai2021IT",
                DoctorName: "Iman Sanad",
                //RouteName: showAlert(context)
              ),
            ]),
          ],
        ),
        //settingIcon(),
      ),
    );
  }

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
            const Divider(
              color: Colors.black,
            ),
            const Text(
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

  Container buildCard({
    required String CourceName,
    required String ImageUrl,
    required String DoctorName,
    required String CourceCode,
    //required var RouteName
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2.5,
      child: InkWell(
        onTap: () {
          diaglog();
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.asset(
                  ImageUrl,
                  height: MediaQuery.of(context).size.height / 4.3,
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Cource Name : ${CourceName}",
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.fade,
                              maxLines: null,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Cource Code : $CourceCode",
                            style: const TextStyle(fontSize: 12),
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Dr : $DoctorName",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, _w / 25, _w / 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: _w / 8.5,
            width: _w / 1.36,
            padding: EdgeInsets.symmetric(horizontal: _w / 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontWeight: FontWeight.w600,
                    fontSize: _w / 22),
                prefixIcon:
                    Icon(Icons.search, color: Colors.black.withOpacity(.6)),
                hintText: 'Search anything.....',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          SizedBox(height: _w / 12),
        ],
      ),
    );
  }
}
