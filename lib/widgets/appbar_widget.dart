import 'package:flutter/material.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_application_19/helpers/textstyle_helper.dart';
import 'package:flutter_application_19/widgets/main_icon_widget.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80)),
          border: Border(
              bottom: BorderSide(color: UiColorHelper.borderColor, width: 1)),
          boxShadow: [
            BoxShadow(
              color: UiColorHelper.appbarBgColor,
              blurRadius: 10,
              offset: const Offset(5, 10), // Shadow position
            ),
          ],
        ),
        child: Row(
          children: [
            const MainIconWidget(),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: RichText(
                text: TextSpan(
                    text: "REMOVE",
                    style: UiTextStyleHelper.titleWhiteTextStyle(context),
                    children: [
                      TextSpan(
                        text: "-BG",
                        style: UiTextStyleHelper.titleTextStyle(context),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

