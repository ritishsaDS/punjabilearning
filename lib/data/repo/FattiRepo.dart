import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/base/BaseRepository.dart';
import 'package:flutter_punjabilearning/data/api/ApiEndPoint.dart';
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/models/ForgotPasswordEntity.dart';

class FattiRepo extends BaseRepository {
  // BuildContext context;
  Future<Fatti> getfatti(
      String token, String type, BuildContext context) async {
    print(token);
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.mcontent, context: context, headers: {
      "Authorization": "Bearer ${token}"
    }, data: {
      "type": type,
    });

    try {
      if (apiResponse.status) {
        final passEntity =
        Fatti.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return Fatti(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
