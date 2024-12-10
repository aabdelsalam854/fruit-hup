import 'package:flutter/material.dart';


import 'widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: customAppBar(context, title: "title"),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
