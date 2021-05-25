import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/base/BaseRepository.dart';
import 'package:flutter_punjabilearning/data/api/ApiEndPoint.dart';
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/models/ForgotPasswordEntity.dart';
import 'package:flutter_punjabilearning/models/MCQEntity.dart';

class MCQRepo extends BaseRepository {
  // BuildContext context;
  Future<MCQEntity> getquiz(
     BuildContext context) async {
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.mcq, context: context, headers: {
    }, );

    try {
      if (apiResponse.status) {
        final passEntity =
        MCQEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return MCQEntity(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
