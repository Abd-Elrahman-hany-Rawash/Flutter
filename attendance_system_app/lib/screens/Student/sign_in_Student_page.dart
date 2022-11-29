import 'package:flutter/material.dart';

class Sign_In_Student extends StatelessWidget {
  const Sign_In_Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController ID = TextEditingController();
    TextEditingController Password = TextEditingController();
    var Myheight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(78, 191, 131, 1),
            // Color: Color.fromARGB(255, 15, 43, 77),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                )),
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
                  child: buildForm(_formKey, ID, Password, context),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Form buildForm(GlobalKey<FormState> _formKey, TextEditingController ID,
      TextEditingController Password, BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        TextFormField(
          onSaved: (val) {
            ID = ID;
          },
          //validator: (val) { },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            hintText: "ID",
            labelText: "ID",
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
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'StudentCources', (route) => true);
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
