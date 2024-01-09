import 'package:flutter/material.dart';
import 'package:flutter_application_19/widgets/appbar_widget.dart';
import 'package:flutter_application_19/widgets/result_widget.dart';
import 'package:flutter_application_19/widgets/return_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        AppbarWidget(),
        ResultWidget(),
        ReturnButtonWidget(),
      ]),
    );
  }
}

