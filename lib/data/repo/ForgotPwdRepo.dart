import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/base/BaseRepository.dart';
import 'package:flutter_punjabilearning/data/api/ApiEndPoint.dart';
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';
import 'package:flutter_punjabilearning/models/ForgotPasswordEntity.dart';


class ForgotPasswordRepo extends BaseRepository {
  // BuildContext context;
  Future<ForgotPasswordEntity> forgotPassword(
      String email, BuildContext context) async {
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.forgetpwd, context: context, headers: {
      'content-type': 'application/json'
    }, data: {
      "userEmail": email,
    });
    try {
      if (apiResponse.status) {
        final passEntity =
            ForgotPasswordEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return ForgotPasswordEntity(errors: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
