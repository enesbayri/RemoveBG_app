
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_19/providers.dart/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class GalleryOrCameraPopup {
  static Future showOptions(BuildContext context, WidgetRef ref) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () async {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              await getImage(source: ImageSource.gallery, ref: ref);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () async {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              await getImage(source: ImageSource.camera, ref: ref);
            },
          ),
        ],
      ),
    );
  }

  static Future<void> getImage(
      {required ImageSource source, required WidgetRef ref}) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      ref.read(currentImageProvider.notifier).state = image;
      ref.read(isHomeProvider.notifier).state = false;
    }
  }
}
