import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_application_19/data/download_file.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_application_19/helpers/textstyle_helper.dart';
import 'package:flutter_application_19/providers.dart/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DownloadButton extends ConsumerWidget {
  const DownloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool onLoading = ref.watch(onLoadingProvider);
    bool onError=ref.watch(onImageErrorProvider);
    return onLoading
        ? Container()
        : (onError? Text("Failed to remove background!",style: UiTextStyleHelper.downloadButton,):AnimatedButton(
            key: UniqueKey(),
            onPress: () async {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Downloading...",style: UiTextStyleHelper.downloadButton,),backgroundColor: UiColorHelper.appbarBgColor,duration: Duration(milliseconds: 200),));

              await FileDownload.moveFile(ref.read(currentImageProvider));
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Downloaded!",style: UiTextStyleHelper.downloadButton,),backgroundColor: UiColorHelper.appbarBgColor));
            },
            height: 50,
            width: 150,
            text: 'Download',
            isReverse: true,
            selectedTextColor: Colors.black,
            transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
            textStyle: UiTextStyleHelper.downloadButton,
            backgroundColor: UiColorHelper.appbarBgColor,
            borderColor: Colors.white,
            borderRadius: 80,
            borderWidth: 1,
            isSelected: false,
          ));
  }
}

