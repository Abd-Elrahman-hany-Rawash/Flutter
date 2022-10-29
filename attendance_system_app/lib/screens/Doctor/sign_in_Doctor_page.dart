import 'package:flutter/material.dart';
import 'package:attendance_system_app/components/crud.dart';
import 'package:attendance_system_app/constant/linkapi.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:attendance_system_app/constant/linkapi.dart';

class Sign_In_Doctor extends StatefulWidget {
  @override
  _Sign_In_DoctorState createState() => _Sign_In_DoctorState();
}

class _Sign_In_DoctorState extends State<Sign_In_Doctor> {
  final GlobalKey<FormState> _studentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //  appBar: AppBar(
          //   title: const Text('Doctor Login'),
          //   centerTitle: true,
          // //  backgroundColor: Colors.black,
          // ),
          backgroundColor: Color.fromARGB(255, 15, 43, 77),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                // Colors.blue.shade100,
                // Colors.blue.shade900,
                Color.fromARGB(255, 15, 43, 77),
                Color.fromARGB(255, 15, 43, 77),
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  // #login, #welcome
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome Doctor",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const MyStatefulWidget(),
                ],
              ),
            ),
          )),
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
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  Crud crud = Crud();

  sign_in_Doctor_page() async {
    if (_formKey.currentState!.validate()) {
      var response = await crud.postRequest(
          linkLoginDoctor, {"Email": Email.text, "Password": Password.text});
      if (response['status'] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('DoctorCources', (route) => false);
      } else {
        AwesomeDialog(
            context: context,
            title: "ALERT",
            body: Text("Incorrect Email or Password"))
          .show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      // height:MediaQuery.of(context).size.height ,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        backgroundBlendMode: BlendMode.luminosity,
        borderRadius: BorderRadius.all(Radius.circular(60)),
        color: Colors.white30,
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
                  controller: Email,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                    hintText: 'Enter your Email',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
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
                      color: Colors.white,
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
              const SizedBox(
                height: 40,
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
                        await sign_in_Doctor_page();
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
  }
}
