import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_images.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final double size;
  const CustomLoadingIndicator({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.loaderGif, width: size);
  }
}
