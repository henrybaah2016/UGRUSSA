import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  final String? infoTitle;
  final String? infoText;
  final String? firstButtonText;
  final String? secondButtonText;
  void Function()? firstButtonAction;
  void Function()? secondButtonAction;

  NotificationDialog({
    Key? key,
    this.infoTitle,
    this.infoText,
    this.firstButtonText,
    this.secondButtonText,
    this.firstButtonAction,
    this.secondButtonAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: infoTitle == null
          ? Container()
          : Text(
        infoTitle!,
        style: const TextStyle(
          fontFamily: "Quicksand",
          fontWeight: FontWeight.w600,
        ),
      ),
      content: infoText == null
          ? Container()
          : Text(
        infoText!,
        style: const TextStyle(
          fontFamily: "Quicksand",
          fontWeight: FontWeight.w300,
          letterSpacing: 0,
        ),
      ),
      actions: <Widget>[
        MaterialButton(
          textColor: Colors.green,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
            ),
          ),
          onPressed: firstButtonAction,
          child: firstButtonText == null
              ? Container()
              : Text(
            firstButtonText!,
            style: const TextStyle(
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
        ),
        MaterialButton(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
            ),
          ),
          textColor: Colors.red,
          onPressed: secondButtonAction,
          child: secondButtonText == null
              ? Container()
              : Text(
            secondButtonText!,
            style: const TextStyle(
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
        )
      ],
    ); //N
  }

}
