import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DoctorCources extends StatefulWidget {
  const DoctorCources({Key? key}) : super(key: key);

  @override
  _DoctorCourcesState createState() => _DoctorCourcesState();
}

class _DoctorCourcesState extends State<DoctorCources>
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
          title: const Text("All Cources"),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xffF5F5F5),
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("add Cource"),
        ),
      ),
      //settingIcon(),
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
    return AlertDialog(
      title: const Text(
        'Select lecture',
        style: TextStyle(fontSize: 25),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height / 10,
        child: Column(children: [
          Divider(
            color: Colors.black,
          ),
          Text(
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
          TextButton(
            onPressed: () {},
            child: const Text("Current lecture"),
          )
        ]),
      ],
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
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height * .2887,
      child:InkWell(onTap: () {
        diaglog();
      },
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            //margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    ImageUrl,
                    height: MediaQuery.of(context).size.height / 4.3,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.fill,
                  ),
                ),
                 Container(
                   color: Colors.redAccent,
                    width: MediaQuery.of(context).size.width * .5,
                   height:MediaQuery.of(context).size.width * .08 ,
                   child: InkWell(onTap: (){},
                       child: Icon(Icons.delete),
                   ),
                 ),
                // Padding(
                //     padding: EdgeInsets.only(left: 10, right: 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           width: MediaQuery.of(context).size.width * .23,
                //           child: ElevatedButton(
                //             style: ButtonStyle(
                //                 backgroundColor:
                //                     MaterialStateProperty.all(Colors.blueAccent)),
                //             onPressed: () => diaglog(),
                //             child: Icon(Icons.remove_red_eye),
                //           ),
                //         ),
                //         Container(
                //           width: MediaQuery.of(context).size.width * .15,
                //           child: ElevatedButton(
                //             style: ButtonStyle(
                //                 backgroundColor:
                //                     MaterialStateProperty.all(Colors.redAccent)),
                //             onPressed: () {},
                //             child: Icon(Icons.delete),
                //           ),
                //         )
                //       ],
                //     ))
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
                  offset: Offset(0, 15),
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
