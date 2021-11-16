import 'package:dio/dio.dart';
import 'package:sahanda_hali/view/login/model/login_request.dart';
import 'package:sahanda_hali/view/login/model/login_response.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  final String loginPath = ILoginServicePath.LOGIN.rawValue;

  Future<LoginResponse?> postUser(LoginRequest request);
}

enum ILoginServicePath { LOGIN }

extension PathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.LOGIN:
        return '/api/login';
    }
  }
}
