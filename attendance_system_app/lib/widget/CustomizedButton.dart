import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
   final VoidCallback? onPressed;
  const CustomizedButton({Key? key, this.buttonText, this.buttonColor, this.textColor, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
            height:  MediaQuery.of(context).size.height/15,
            width: MediaQuery.of(context).size.width-60,
            decoration: BoxDecoration(
                color: buttonColor,
              //  border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
                child: Text(
              buttonText!,
              style: TextStyle(fontWeight: FontWeight.w500,
                color: textColor,
                fontSize: 28,
              ),
            ))),
      ),
    );
    
  }
}