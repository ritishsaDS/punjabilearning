import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/base/BaseRepository.dart';
import 'package:flutter_punjabilearning/data/api/ApiEndPoint.dart';
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';
import 'package:flutter_punjabilearning/models/AppData.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/models/ForgotPasswordEntity.dart';

class AppRepo extends BaseRepository {
  // BuildContext context;
  Future<AppData> appdetail(
      BuildContext context) async {
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.appdetail, context: context, );

    try {
      if (apiResponse.status) {
        final passEntity =
        AppData.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return AppData(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
