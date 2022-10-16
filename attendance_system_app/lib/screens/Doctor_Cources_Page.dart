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
    var appbar = AppBar(
      title: const Text("All Cources"),
      centerTitle: true,
    );
    var Myheight = (MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        backgroundColor: const Color(0xffF5F5F5),
        body: ListView(
          children: [
            Container(
              height: Myheight * .35,
              child: Row(children: [
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
            ),
            Container(
              height: Myheight * .35,
              child: Row(children: [
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
            ),
            Container(
              height: Myheight * .35,
              child: Row(children: [
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
            ),
            Container(
              height: Myheight * .35,
              child: Row(children: [
                buildCard(
                  CourceName: "Data Communication",
                  ImageUrl: 'assets/images/Datacommunnication.png',
                  CourceCode: "Fcai2021IT",
                  DoctorName: "Iman Sanad",
                  //RouteName: showAlert(context)
                ),
              ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            CreateCource(context);
          },
          icon: Icon(Icons.add),
          label: Text("Create Cource"),
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
            child: const Text(
              "Current lecture",
              style: TextStyle(fontSize: 25),
            ),
          )
        ]),
      ],
    );
  }

  buildCard({
    required String CourceName,
    required String ImageUrl,
    required String DoctorName,
    required String CourceCode,
    //required var RouteName
  }) {
    return LayoutBuilder(
      builder: (ctx, constrain) => Container(
        margin: EdgeInsets.only(top: constrain.maxHeight * .05),
        width: MediaQuery.of(context).size.width * .5,
        height: constrain.maxHeight,
        child: InkWell(
          onTap: () {
            diaglog();
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            //margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    ImageUrl,
                    height: constrain.maxHeight * .7,
                    width: MediaQuery.of(context).size.width * .5,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  height: constrain.maxHeight * .21,
                  width: MediaQuery.of(context).size.width * .5,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    label: Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CreateCource(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Cource Name'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Acces Code'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
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
