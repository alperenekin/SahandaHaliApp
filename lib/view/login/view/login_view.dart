import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahanda_hali/view/login/viewmodel/login_cubit.dart';
import 'package:sahanda_hali/core/extension/context_extention.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(emailController, passwordController, formKey),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Welcome To SahandaHalı',style: context.textTheme.headline4?.copyWith(color: Colors.grey.shade50),textAlign: TextAlign.center,),
              Form(key: formKey,child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: context.paddingHighHorizontal,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail,color: Colors.green.shade900,),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.70),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.green.shade900),
                        border: OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.green.shade900, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.green.shade900, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Padding(
                    padding: context.paddingHighHorizontal,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key,color: Colors.green.shade900,),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.70),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.green.shade900),
                        border: OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.green.shade900, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.green.shade900, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
