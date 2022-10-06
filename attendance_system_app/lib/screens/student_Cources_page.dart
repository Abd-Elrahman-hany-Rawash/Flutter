import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentMaterials extends StatefulWidget {
  @override
  _StudentMaterialsState createState() => _StudentMaterialsState();
}

class _StudentMaterialsState extends State<StudentMaterials>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
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
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Cources"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: [
          ListView(
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
                    RouteName: "/"),
                buildCard(
                    CourceName: "Data Communication",
                    ImageUrl: 'assets/images/Datacommunnication.png',
                    CourceCode: "Fcai2021IT",
                    DoctorName: "Iman Sanad",
                    RouteName: "/"),
              ]),
              Row(children: [
                buildCard(
                    CourceName: "Advanced SoftWare ",
                    ImageUrl: 'assets/images/Datacommunnication.png',
                    CourceCode: "Fcai2021IT",
                    DoctorName: "Iman Sanad",
                    RouteName: "/"),
                buildCard(
                    CourceName: "Data Communication",
                    ImageUrl: 'assets/images/Datacommunnication.png',
                    CourceCode: "Fcai2021IT",
                    DoctorName: "Iman Sanad",
                    RouteName: "/"),
              ]),
              Row(children: [
                buildCard(
                    CourceName: "Data Communication",
                    ImageUrl: 'assets/images/Datacommunnication.png',
                    CourceCode: "Fcai2021IT",
                    DoctorName: "Iman Sanad",
                    RouteName: "/"),
                buildCard(
                    CourceName: "Data Communication",
                    ImageUrl: 'assets/images/Datacommunnication.png',
                    CourceCode: "Fcai2021IT",
                    DoctorName: "Iman Sanad",
                    RouteName: "/"),
              ]),
              Row(children: [
                buildCard(
                    CourceName: "Data Communication",
                    ImageUrl: 'assets/images/Datacommunnication.png',
                    CourceCode: "Fcai2021IT",
                    DoctorName: "Iman Sanad",
                    RouteName: "/"),
              ]),
            ],
          ),
          //settingIcon(),
        ],
      ),
    );
  }

  Container buildCard(
      {required String CourceName,
      required String ImageUrl,
      required String DoctorName,
      required String CourceCode,
      required String RouteName}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2.9,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(RouteName),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.only(left: 10,top: 10,right:10),
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
              Padding(
                  padding: EdgeInsets.only(left:10,top: 10,right: 10 ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Cource Name : ${CourceName}",
                            style: TextStyle(fontSize: 10),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Cource Code : ${CourceCode}",
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Dr : ${DoctorName}",
                            style: TextStyle(fontSize: 14),
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
