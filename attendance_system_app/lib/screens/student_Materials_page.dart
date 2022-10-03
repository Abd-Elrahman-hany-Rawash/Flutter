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
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: [
          ListView(
            // physics:
            // BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  searchBar(),
                ],
              ),
              SizedBox(height: _w / 20),
              Card(
                  'Data Communication',
                  'Dr: Eman Sanad ',
                  'assets/images/Datacommunnication.png',
                  RouteWhereYouGo(),
                  "FCAI 2022IT2003"),
              Card(
                  'Data Structure',
                  'Dr: Besher ',
                  'assets/images/DataStructure.png',
                  RouteWhereYouGo(),
                  "FCAI 2022IT2003"),
              Card(
                  'Data Communication',
                  'Dr: Eman Sanad ',
                  'assets/images/Datacommunnication.png',
                  RouteWhereYouGo(),
                  "FCAI 2022IT2003"),
              Card(
                  'Data Communication',
                  'Dr: Eman Sanad ',
                  'assets/images/Datacommunnication.png',
                  RouteWhereYouGo(),
                  "FCAI 2022IT2003"),
              Card(
                  'Data Communication',
                  'Dr: Eman Sanad ',
                  'assets/images/Datacommunnication.png',
                  RouteWhereYouGo(),
                  "FCAI 2022IT2003"),
            ],
          ),
          //settingIcon(),
        ],
      ),
    );
  }

  // Widget settingIcon() {
  //   double _w = MediaQuery.of(context).size.width;
  //   return Padding(
  //     padding: EdgeInsets.fromLTRB(0, _w / 10, _w / 20, 0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         Container(
  //           height: _w / 8.5,
  //           width: _w / 8.5,
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black.withOpacity(.1),
  //                 blurRadius: 30,
  //                 offset: Offset(0, 15),
  //               ),
  //             ],
  //             shape: BoxShape.circle,
  //           ),
  //           child: IconButton(
  //             splashColor: Colors.transparent,
  //             highlightColor: Colors.transparent,
  //             tooltip: 'Settings',
  //             icon: Icon(Icons.settings,
  //                 size: _w / 17, color: Colors.black.withOpacity(.6)),
  //             onPressed: () {
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
          SizedBox(height: _w / 14),
        ],
      ),
    );
  }

  Widget Card(
    String title,
    String subtitle,
    String image,
    Widget route,
    String Code,
  ) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Opacity(
            opacity: _animation.value,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                // Navigator.of(context).push(MyFadeRoute(route: route));
              },
              child: Container(
                width: _w / 1.4,
                height: _w / 1.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.05), blurRadius: 50),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: _w / 1.4,
                      height: _w / 2.6,
                      decoration: BoxDecoration(
                        color: Color(0xff5C71F3),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      alignment: Alignment.center,
                      // child: Text(
                      //   'Add image here',
                      //   textScaleFactor: 1.2,
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      child: Image.asset(image,
                          fit: BoxFit.fill, width: _w / 1.4, height: _w / 2.6),
                    ),
                    Container(
                      height: _w / 6,
                      width: _w / 1.4,
                      padding: EdgeInsets.symmetric(horizontal: _w / 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            //  textScaleFactor: 1.4,
                            //maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(.7),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          Text(
                            subtitle,
                            // textScaleFactor: 1,
                            //   maxLines: 1,
                            //  softWrap: true,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.7),
                                fontSize: 15),
                          ),
                          Text(
                            Code,
                            // textScaleFactor: 1,
                            //   maxLines: 1,
                            //  softWrap: true,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.7),
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class MyFadeRoute extends PageRouteBuilder {
//   final Widget page;
//   final Widget route;
//
//   MyFadeRoute({required this.page, required this.route})
//       : super(
//     pageBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         ) =>
//     page,
//     transitionsBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         Widget child,
//         ) =>
//         FadeTransition(
//           opacity: animation,
//           child: route,
//         ),
//   );
// }

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('EXAMPLE  PAGE',
            style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w600,
                letterSpacing: 1)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}
