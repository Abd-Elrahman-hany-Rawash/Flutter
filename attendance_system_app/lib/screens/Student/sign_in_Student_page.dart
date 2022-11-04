import 'package:attendance_system_app/components/crud.dart';
import 'package:attendance_system_app/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:attendance_system_app/constant/linkapi.dart';

class Sign_In_Student extends StatelessWidget {
  const Sign_In_Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Myheight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
       // backgroundColor: Color.fromARGB(255, 15, 43, 77),
        body: Container(
          decoration: BoxDecoration(color:Color.fromARGB(255, 15, 43, 77) ),
         // Color: Color.fromARGB(255, 15, 43, 77),
          height: Myheight,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .02),
              width: double.infinity,
              color: Color.fromARGB(255, 15, 43, 77),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Myheight * .08),
                    // #login, #welcome
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Myheight * .07,
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                          SizedBox(
                            height: Myheight * .02,
                          ),
                          SizedBox(
                            height: Myheight * .05,
                            child: Text(
                              "Welcome Student",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Myheight * .08),
                    SizedBox(child: const MyStatefulWidget(),height: Myheight*.7,),
                    SizedBox(height: Myheight * .13),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController ID = TextEditingController();
  TextEditingController Password = TextEditingController();
  Crud crud = Crud();

  sign_in_Student_page() async {
    if (_formKey.currentState!.validate()) {
      var response = await crud.postRequest(
          linkLoginStudent, {"ID": ID.text, "Password": Password.text});
      if (response['status'] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('StudentCources', (route) => false);
      } else {
        AwesomeDialog(
            context: context,
            title: "ALERT",
            body: Text("Incorrect ID or Password"))
          ..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color mycolor = Colors.white;
    return LayoutBuilder(builder: (BuildContext, BoxConstraints) {
      return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        // height:MediaQuery.of(context).size.height ,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.all(Radius.circular(60)),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: ID,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: mycolor,
                      ),
                      labelText: "ID",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                      hintText: 'Enter your ID',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: Password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: mycolor,
                      ),
                      labelText: "password",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                      hintText: 'Enter your password',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the password';
                      }
                      return null;
                    },
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.9,
                      height: MediaQuery.of(context).size.width / 9,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () async {
                          await sign_in_Student_page();
                        },
                        child: const Text(
                          'Login ',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
