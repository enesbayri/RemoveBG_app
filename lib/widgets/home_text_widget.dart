import 'package:flutter/material.dart';
import 'package:flutter_application_19/helpers/textstyle_helper.dart';
import 'package:flutter_application_19/services/cache_services.dart';

class HomeText extends StatefulWidget {
  const HomeText({
    super.key,
  });

  @override
  State<HomeText> createState() => _HomeTextState();
}

class _HomeTextState extends State<HomeText> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CleanCache.clean();
    
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Please upload image!",
      style: UiTextStyleHelper.downloadButton,
    );
  }
}
