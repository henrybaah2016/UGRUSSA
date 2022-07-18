import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  final double imageHeight;
  final double imageWidth;
  final double spinnerHeight;
  final double spinnerWidth;

  const ImageLoader({
    Key? key,
    required this.url,
    required this.imageHeight,
    required this.imageWidth,
    required this.spinnerHeight,
    required this.spinnerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: imageHeight,
      width: imageWidth,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: spinnerWidth,
            height: spinnerHeight,
            margin: const EdgeInsets.all(10.0),
            child: LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,
              colors: [Theme.of(context).primaryColor],
            ),
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return SizedBox(
          height: imageHeight,
          width: imageWidth,
        );
      },
    );
  }
}
