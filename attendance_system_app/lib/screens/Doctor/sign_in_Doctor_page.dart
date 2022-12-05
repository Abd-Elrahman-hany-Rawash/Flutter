import 'package:flutter/material.dart';

class Sign_In_Doctor extends StatefulWidget {
  @override
  _Sign_In_DoctorState createState() => _Sign_In_DoctorState();
}

class _Sign_In_DoctorState extends State<Sign_In_Doctor> {
  final GlobalKey<FormState> _studentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var Myheight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(78, 191, 131, 1),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .45,
                child: Center(child: Image.asset("assets/images/Doctor.png")),
              ),
              Container(
                height: Myheight * .55,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: const DoctorForm(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class DoctorForm extends StatefulWidget {
  const DoctorForm({Key? key}) : super(key: key);

  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        TextFormField(
          onSaved: (val) {
            Email = Email;
          },
          //validator: (val) { },
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.keyboard, color: Colors.green),
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
              suffixIcon: Icon(Icons.remove_red_eye, color: Colors.green),
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
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("DoctorCources");

                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Text("Login",
                      style: TextStyle(
                          letterSpacing: 2, color: Colors.white, fontSize: 25)),
                ),
              ),
            ]),
          ],
        )
      ]),
    );
    ;
  }
}
