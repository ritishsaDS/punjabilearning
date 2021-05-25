import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/base/BaseRepository.dart';
import 'package:flutter_punjabilearning/data/api/ApiEndPoint.dart';
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/models/ForgotPasswordEntity.dart';
import 'package:flutter_punjabilearning/models/UserData.dart';
import 'package:flutter_punjabilearning/utils/SharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutRepo extends BaseRepository {
  // BuildContext context;
  Future<UserDataEntity> logout(String token, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("token"));
    String tokens = prefs.getString("token");
    
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
      "http://3.13.67.137/api/" + ApiEndpoint.logout,
      context: context,
      headers: {"Authorization": "Bearer${tokens}"},
    );

    try {
      if (apiResponse.status) {
        final passEntity = UserDataEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return UserDataEntity(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
