import 'package:flutter/material.dart';
import 'package:frute_hup/core/widget/custom_abb_bar.dart';

import 'widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "title"),
      body: const HomeViewBody(),
    );
  }
}
