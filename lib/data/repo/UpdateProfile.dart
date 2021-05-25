import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/base/BaseRepository.dart';
import 'package:flutter_punjabilearning/data/api/ApiEndPoint.dart';
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';
import 'package:flutter_punjabilearning/models/AppData.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/models/ForgotPasswordEntity.dart';
import 'package:flutter_punjabilearning/models/UserProfile.dart';

class UpdateProfileRepo extends BaseRepository {
  // BuildContext context;
  Future<UserProfile> updateprofile(String token,String name,String email,String phone, String image,
      BuildContext context) async {
    FormData formData = new FormData.fromMap({
      "name": name,
      "email" :email,
      "phone_number" :phone ,
    });
    if (image != null && image != "" ) {
      var mcDocsFileName = image.split('/').last;
      if (!image.contains("."))
      {
        mcDocsFileName = image + ".jpg";
      }

      formData.files.add(MapEntry("image",
          await MultipartFile.fromFile(image, filename: mcDocsFileName)));
    }
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.updateprofile, context: context,
        headers: {
          "Authorization": "Bearer ${token}"
        },isformdata: true,
        formdata: formData);

    try {
      if (apiResponse.status) {
        final passEntity =
        UserProfile.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return UserProfile(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
