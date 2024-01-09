
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_application_19/helpers/textstyle_helper.dart';
import 'package:flutter_application_19/providers.dart/all_providers.dart';
import 'package:flutter_application_19/services/api_services.dart';
import 'package:flutter_application_19/widgets/download_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InResultButton extends ConsumerWidget {
  const InResultButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool reqSent = ref.watch(reqSentProvider);
    return reqSent
        ? DownloadButton()
        : AnimatedButton(
            key: UniqueKey(),
            onPress: () async {
              await Future.delayed(Duration(milliseconds: 300));
              ref.read(reqSentProvider.notifier).state = true;
              ref.read(onLoadingProvider.notifier).state = true;
              File imgFile = ref.read(currentImageProvider);
              ref.read(currentImageProvider.notifier).state =
                  (await ApiService.removeBg(imgFile, ref));
            },
            height: 50,
            width: 150,
            text: 'Remove-BG',
            animationDuration: Duration(milliseconds: 200),
            isReverse: true,
            selectedTextColor: Colors.black,
            selectedBackgroundColor: UiColorHelper.mainBlue,
            transitionType: TransitionType.TOP_CENTER_ROUNDER,
            textStyle: UiTextStyleHelper.downloadButton,
            backgroundColor: UiColorHelper.appbarBgColor,
            borderColor: Colors.white,
            borderRadius: 80,
            isSelected: false,
            borderWidth: 1,
          );
  }
}

