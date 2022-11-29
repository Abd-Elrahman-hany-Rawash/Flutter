import 'package:flutter/material.dart';
import 'package:attendance_system_app/components/crud.dart';
import 'package:attendance_system_app/constant/linkapi.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:attendance_system_app/constant/linkapi.dart';

import 'Doctor_Cources_Page.dart';

class Sign_In_Doctor extends StatefulWidget {
  @override
  _Sign_In_DoctorState createState() => _Sign_In_DoctorState();
}

class _Sign_In_DoctorState extends State<Sign_In_Doctor> {
  final GlobalKey<FormState> _studentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController Email = TextEditingController();
    TextEditingController Password = TextEditingController();
    var Myheight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 15, 43, 77),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(78, 191, 131, 1),
            // Color: Color.fromARGB(255, 15, 43, 77),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .45,
                child: Center(child: Image.asset("assets/images/Doctor.png")),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .55,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                padding: const EdgeInsets.only(
                    left: 10, right: 20, top: 10, bottom: 5),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  // height:MediaQuery.of(context).size.height ,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  ),
                  child: buildForm(_formKey, Email, Password, context),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Form buildForm(GlobalKey<FormState> _formKey, TextEditingController Email,
      TextEditingController Password, BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        TextFormField(
          onSaved: (val) {
            Email = Email;
          },
          //validator: (val) { },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            hintText: "Email",
            labelText: "Email",
            labelStyle: TextStyle(color: Colors.green, fontSize: 25),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Colors.green),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        TextFormField(
          onSaved: (val) {
            Password = Password;
          },
          //  validator: (val) {},
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.green,
              ),
              hintText: "Password",
              //  hintStyle: TextStyle(color: Colors.black),
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.green, fontSize: 25),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 2, color: Colors.green),
              )),
          keyboardType: TextInputType.visiblePassword,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 200,
                height: 38,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'DoctorCources', (route) => true);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Text("Login",
                      style: TextStyle(
                          letterSpacing: 2, color: Colors.white, fontSize: 20)),
                ),
              ),
            ]),
          ],
        )
      ]),
    );
  }
}
