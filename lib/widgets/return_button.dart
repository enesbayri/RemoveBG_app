
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_application_19/helpers/textstyle_helper.dart';
import 'package:flutter_application_19/providers.dart/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReturnButtonWidget extends ConsumerWidget {
  const ReturnButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool ishome = ref.watch(isHomeProvider);
    return Positioned(
        bottom: MediaQuery.of(context).size.height * 0.04,
        left: MediaQuery.of(context).size.width / 2 - 75,
        child: !ishome
            ? Container(
                child: AnimatedButton(
                  key: UniqueKey(),
                  onPress: () async {
                    await Future.delayed(Duration(milliseconds: 300));
                    ref.read(reqSentProvider.notifier).state = false;
                    ref.read(isHomeProvider.notifier).state = true;
                    ref.read(onLoadingProvider.notifier).state = false;
                    ref.read(onImageErrorProvider.notifier).state = false;
                  },
                  animationDuration: Duration(milliseconds: 200),
                  height: 50,
                  width: 150,
                  text: 'Return',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.CENTER_LR_IN,
                  textStyle: UiTextStyleHelper.downloadButton,
                  backgroundColor: UiColorHelper.appbarBgColor,
                  selectedBackgroundColor: UiColorHelper.mainYellow,
                  borderColor: UiColorHelper.mainWhite,
                  borderRadius: 0,
                  borderWidth: 1,
                  isSelected: false,
                ),
              )
            : Container());
  }
}
