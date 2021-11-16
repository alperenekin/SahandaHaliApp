
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sahanda_hali/view/login/model/login_request.dart';
import 'package:sahanda_hali/view/login/model/login_response.dart';
import 'ilogin_service.dart';

class LoginService extends ILoginService{
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginResponse?> postUser(LoginRequest request) async {
    try{
      final response = await dio.post(loginPath,data: request);
      if(response.statusCode == HttpStatus.ok){
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        return loginResponse;
      }else{
        return null;
      }
    }catch(e){
      return null;
    }


  }
}