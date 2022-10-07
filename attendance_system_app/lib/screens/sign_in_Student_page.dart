import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Sign_In_Student extends StatelessWidget {
  const Sign_In_Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor:  Color.fromARGB(255, 15,43, 77),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Color.fromARGB(255, 15,43, 77),
                  Color.fromARGB(255, 15,43, 77),
              // Colors.blue.shade100,
              // Colors.blue.shade900,
              // Colors.blue,
              // Colors.blue.shade900,
              // Colors.blue.shade200,
              // Colors.blue.shade900,
            ])),
            child: Center(
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
                          "Welcome Student",
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

  @override
  Widget build(BuildContext context) {
   const Color mycolor=Colors.white;
    TextEditingController ID = TextEditingController();
    TextEditingController password = TextEditingController();
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
                      color:mycolor,
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
                  controller: password,
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
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed('StudentCources'),
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
