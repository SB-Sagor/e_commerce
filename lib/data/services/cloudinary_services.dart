// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../../utils/constants/keys.dart';
// import '../../utils/exceptions/firebase_exceptions.dart';
// import '../../utils/exceptions/format_exceptions.dart';
// import '../../utils/exceptions/platform_exceptions.dart';
//
// class CloudinaryServices extends GetxController {
//   static CloudinaryServices get instance => Get.find();
//   final _dio = dio.Dio();
//
//   Future<dio.Response> uploadImage(File image,String folderName) async {
//     try {
//       String api = UApiUrls.uploadApi(UKeys.cloudName);
//       final formData = dio.FormData.fromMap({
//         'upload_preset': UKeys.uploadPreset,
//         'folder': UKeys.profileFolder,
//         'file': await dio.MultipartFile.fromFile(
//           image.path,
//           filename: image.path.split('/').last,
//         ),
//       });
//       dio.Response response = await _dio.post(api, data: formData);
//       return response;
//     } catch (e) {
//       debugPrint('Error While Upload Profile:$e');
//       throw 'Failed to upload profile picture. Please try again';
//     }
//   }
// }
