import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/base/BaseRepository.dart';
import 'package:flutter_punjabilearning/data/api/ApiEndPoint.dart';
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';
import 'package:flutter_punjabilearning/models/AppData.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/models/ForgotPasswordEntity.dart';
import 'package:flutter_punjabilearning/models/UserProfile.dart';
import 'package:dio/dio.dart';

class GetProfileRepo extends BaseRepository {
  // BuildContext context;
  Future<UserProfile> getprofile(String token, BuildContext context) async {
    print(token);
    var response = await Dio().get(
      "http://3.13.67.137/api/user-info",
      options: Options(headers: {"Authorization": "Bearer ${token}"}),
    );
    try {
      final passEntity = UserProfile.fromJson(response.data);
      return passEntity;
    } catch (error, stacktrace) {}
  }
}
