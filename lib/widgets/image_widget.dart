import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_application_19/helpers/textstyle_helper.dart';
import 'package:flutter_application_19/providers.dart/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageWidget extends ConsumerWidget {
  const ImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    File img = ref.watch(currentImageProvider);
    bool onLoading = ref.watch(onLoadingProvider);
    bool onError=ref.watch(onImageErrorProvider);

    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: !ref.watch(reqSentProvider)
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: UiColorHelper.imageShadowColor,
                  blurRadius: 10,
                  offset: const Offset(5, 5), // Shadow position
                ),
              ],
            )
          : BoxDecoration(),
      child: !onLoading
          ? (!onError ? Image.file(
              key: UniqueKey(),
              img,
              fit: BoxFit.cover,
            ): Image.asset(
              key: UniqueKey(),
              "assets/icons/oops.png",
              fit: BoxFit.cover,
            ))
          : Center(
              child: Stack(children: [
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator(
                            color: UiColorHelper.mainYellow))),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Removing...",
                    style: UiTextStyleHelper.downloadButton,
                  ),
                )
              ]),
            ),
    );
  }
}
