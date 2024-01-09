import 'package:flutter/material.dart';
import 'package:flutter_application_19/data/get_image.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeResult extends ConsumerWidget {
  const HomeResult({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: UiColorHelper.mainYellow,
              blurRadius: 5,
              offset: const Offset(3, 5), // Shadow position
            ),
          ],
        ),
        child: InkWell(
          onTap: () async {
            await GalleryOrCameraPopup.showOptions(context, ref);
            //ref.read(isHomeProvider.notifier).state=false;
          },
          child: Image.asset(
            "assets/icons/upload.png",
            fit: BoxFit.cover,
            height: 180,
            width: 180,
          ),
        ));
  }
}
