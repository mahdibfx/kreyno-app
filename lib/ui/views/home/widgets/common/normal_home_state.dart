import 'package:flutter/material.dart';
import 'package:kreyno/ui/views/home/widgets/common/car_top_bar.dart';
import 'package:kreyno/ui/views/home/widgets/seller/let_my_place_bottombar.dart';

class NormalHomeState extends StatelessWidget {
  const NormalHomeState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [CarTopBar(), LetMyPlaceBottombar()],
    );
  }
}
