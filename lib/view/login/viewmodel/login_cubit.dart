import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sahanda_hali/view/login/model/login_request.dart';
import 'package:sahanda_hali/view/login/model/login_response.dart';
import 'package:sahanda_hali/view/login/service/Ilogin_service.dart';
import 'package:sahanda_hali/view/login/service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;
  bool isVisible = false;
  final LoginService loginService;

  LoginCubit(this._emailController, this._passwordController, this._formKey, this.loginService) : super(LoginInitial(false));

  Future<void> loginUser() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      LoginRequest loginRequest = LoginRequest(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      LoginResponse? response = await loginService.postUser(loginRequest);
      if (response != null) {
        emit(LoginCompleteState(response));
      } else {
        emit(LoginFailedState('Username or password is wrong'));
      }
    } else {
      emit(LoginFailedState('Input is invalid'));
    }
  }

  void changePasswordVisibility(){
    isVisible = !isVisible;
    emit(LoginInitial(isVisible));
  }
}

