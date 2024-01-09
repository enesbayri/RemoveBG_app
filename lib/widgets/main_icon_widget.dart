import 'package:flutter/material.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class MainIconWidget extends StatelessWidget {
  const MainIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
          width: 140,
          height: 100,
          child: ClipPath(
            clipper: ParallelogramClipper(),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: UiColorHelper.mainYellow,
                    blurRadius: 15,
                    offset: const Offset(35, 76), // Shadow position
                  ),
                ],
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Image.asset(
                  "assets/icons/icon.png",
                  width: 120,
                  height: 80,
                ),
              )),
            ),
          )),
    );
  }
}
