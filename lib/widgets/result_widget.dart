
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_application_19/providers.dart/all_providers.dart';
import 'package:flutter_application_19/widgets/home_result_widget.dart';
import 'package:flutter_application_19/widgets/home_text_widget.dart';
import 'package:flutter_application_19/widgets/image_widget.dart';
import 'package:flutter_application_19/widgets/result_buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultWidget extends ConsumerWidget {
  const ResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isHome = ref.watch(isHomeProvider);
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(80)),
          border: Border.all(color: UiColorHelper.borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: UiColorHelper.appbarBgColor,
              blurRadius: 5,
              offset: const Offset(10, 10), // Shadow position
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              isHome ? HomeResult() : ImageWidget(),
              SizedBox(
                height: 20,
              ),
              isHome ? HomeText() : InResultButton(),
            ],
          ),
        ),
      ),
    );
  }
}

