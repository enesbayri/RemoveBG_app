import 'package:flutter_application_19/providers.dart/all_providers.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  static Future removeBg(File imageFile, WidgetRef ref) async {
    
      File newImgfile = File('${imageFile.parent.path}/no-bg.png');
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.remove.bg/v1.0/removebg'),
      );
      request.headers['X-Api-Key'] = 'Your-Api-Key';
      request.files.add(await http.MultipartFile.fromPath(
        'image_file',
        imageFile.path,
      ));
      request.fields['size'] = 'auto';
      var response = await request.send();
      if(response.statusCode==200){
        await response.stream.pipe(newImgfile.openWrite());
        ref.read(onLoadingProvider.notifier).state = false;
        return newImgfile; 
      }else{
        ref.read(onLoadingProvider.notifier).state = false;
        ref.read(onImageErrorProvider.notifier).state=true;
        return imageFile;
      }
      
    
  }
}

