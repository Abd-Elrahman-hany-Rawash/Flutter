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
    buildCouce() {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          elevation: 5,
          child: ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical:4,horizontal: 4),
            leading: Image.network(
              "https://play-lh.googleusercontent.com/5UwL7nXjNKqMAaF9zDyLupztNcoEdppXfWXJYKJMES7CK-rZ-t7bM5gy9p4Gc7qUm-Y",
              fit: BoxFit.fill,
            ),
            title: Text('Data conmmunication',style: TextStyle(fontSize: 18),),
            subtitle: Text('Cource Code :2020Fci3It313',style: TextStyle(fontSize: 15)),
            trailing: PopupMen(MenuList: [
              PopupMenuItem(
                  child: InkWell(
                onTap: () {
                  diaglog();
                },
                child: const ListTile(
                  leading: Icon(Icons.remove_red_eye_sharp),
                  title: Text("View"),
                ),
              )),
              const PopupMenuItem(
                  child: ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit"),
              )),
              const PopupMenuItem(

                  child: ListTile(
                leading: Icon(Icons.delete),
                title: Text("Remove"),
              )),
            ], icon: const Icon(Icons.more_vert_rounded)),
            isThreeLine: true,
          ),
        ),
      );
    }

    TextEditingController CourceName = TextEditingController();
    TextEditingController CourceCode = TextEditingController();
    double _w = MediaQuery.of(context).size.width;
    var appbar = AppBar(
      title: const Text("All Courses"),
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
            SizedBox(child: buildCouce()),
            buildCouce(),
            buildCouce(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            CreateCource(context);
          },
          icon: Icon(Icons.add),
          label: const Text("Create Course"),
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
        child: Column(children: const [
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
                "DoctorHistory",
              );
            },
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Current lecture",
              style: TextStyle(fontSize: 19),
            ),
          )
        ]),
      ],
    );
  }

  CreateCource(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const <Widget>[
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

class PopupMen extends StatelessWidget {
  final List<PopupMenuEntry> MenuList;
  final Widget? icon;

  const PopupMen({Key? key, required this.MenuList, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width * 0.5, height: 180),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: ((context) => MenuList),
      icon: icon,
    );
  }
}
