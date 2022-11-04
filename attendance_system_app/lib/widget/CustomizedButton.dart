import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;

  const CustomizedButton(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      this.textColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext, BoxConstraints) {
        return InkWell(
          onTap: onPressed,
          child: Container(
            //height: BoxConstraints!*1,
           // height: 20,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*.8,
              decoration: BoxDecoration(
                  color: buttonColor,
                  //  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: Text(
                buttonText!,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: textColor,
                  fontSize: 25,
                ),
              ))),
        );
      },
    );
  }
}
