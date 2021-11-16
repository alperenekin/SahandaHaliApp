import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahanda_hali/view/login/model/login_response.dart';

class LoginDetail extends StatelessWidget {
  final LoginResponse response;
  const LoginDetail(this.response, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(response.token ?? '')),);
  }
}
