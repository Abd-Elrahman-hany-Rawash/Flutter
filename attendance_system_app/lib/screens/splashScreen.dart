import 'package:attendance_system_app/screens/start_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/StartImage.png',
        fit: BoxFit.cover,
      ),
      logoWidth:MediaQuery.of(context).size.width *.5,
      loadingText: Text("Loding",style: TextStyle(color: Colors.white),),
      backgroundColor: Color.fromRGBO(102, 163, 187, 1),
      navigator: const Start_Page(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}
