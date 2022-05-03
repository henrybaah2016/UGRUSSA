import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? alertTitle;
  final String? alertMessage;
  const CustomAlertDialog({Key? key, this.alertTitle, this.alertMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(alertTitle!),
      content: Text(alertMessage!),
      actions: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  "Okay",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
