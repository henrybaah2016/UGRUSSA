import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProgressDialog extends StatelessWidget {
  String? message;

  ProgressDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: const Duration(seconds: 150),
      backgroundColor: Colors.transparent,
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
              width: 50,
              child: LoadingIndicator(
                indicatorType: Indicator.lineSpinFadeLoader,
                colors: [Colors.black],
              ),
            ),
            const SizedBox(height: 20),
            Text(message ?? 'Loading...'),
          ],
        ),
      ),
    );
  }
}
