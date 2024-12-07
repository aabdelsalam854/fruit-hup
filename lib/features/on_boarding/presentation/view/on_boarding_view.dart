import 'package:flutter/material.dart';

import 'widget/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String onBoardingViewRoute = "onBoardingViewRoute";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBoardingViewBody()),
    );
  }
}
