
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_application_19/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const ProviderScope(child: RemoveBG()));
}


class RemoveBG extends StatelessWidget {
  const RemoveBG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RemoveBG',
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: UiColorHelper.appbarBgColor
          /* light theme settings */
          ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}


