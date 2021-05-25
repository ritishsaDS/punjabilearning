import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/base/BaseRepository.dart';
import 'package:flutter_punjabilearning/data/api/ApiEndPoint.dart';
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';
import 'package:flutter_punjabilearning/models/UserData.dart';

class RegisterUserRepo extends BaseRepository {
  // BuildContext context;
  Future<UserDataEntity> registeruser(
      String email,{String password,BuildContext context,String name,String cpassword}) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
        ApiEndpoint.userRegister,context: context,
        headers: {
          'content-type': 'application/json'
        },
        data: {
          "email": email,
          "password": password,
          "name" :name,
          "c_password" :cpassword
        }
        );
    try {
      if (apiResponse.status) {
        final passEntity = UserDataEntity.fromJson(apiResponse.response.data);
        return passEntity;
      } else
      {
        return UserDataEntity(errors: apiResponse.msg);
      }
    }
    catch (error, stacktrace)
    {

    }

  }
}
