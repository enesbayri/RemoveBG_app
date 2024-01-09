
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final butonSelectProvider = StateProvider<bool>((ref) {
  return false;
});

final reqSentProvider = StateProvider<bool>((ref) {
  return false;
});
final isHomeProvider = StateProvider<bool>((ref) {
  return true;
});
final currentImageProvider = StateProvider<File>((ref) {
  return File("");
});
final onLoadingProvider = StateProvider<bool>((ref) => false);
final onImageErrorProvider = StateProvider<bool>((ref) => false);

