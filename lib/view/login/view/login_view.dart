import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahanda_hali/core/components/textfield/custom_textformfield.dart';
import 'package:sahanda_hali/view/login/service/login_service.dart';
import 'package:sahanda_hali/view/login/view/login_detail.dart';
import 'package:sahanda_hali/view/login/viewmodel/login_cubit.dart';
import 'package:sahanda_hali/core/extension/context_extention.dart';

class LoginView extends StatefulWidget {

  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
          emailController,
          passwordController,
          formKey,
          LoginService(Dio(BaseOptions(baseUrl: 'https://reqres.in')))),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginCompleteState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginDetail(state.response)));
            } else if (state is LoginFailedState) {
              final snackBar = SnackBar(content: Text(state.message));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return buildContainer(context, state);
          },
        ),
      ),
    );
  }

  Container buildContainer(BuildContext context, LoginState state) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
      child: buildComponentsColumn(context, state),
    );
  }

  Column buildComponentsColumn(BuildContext context, LoginState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildIntroText(context),
        Form(key: formKey,
            autovalidateMode: state is LoginFailedState ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: state is  LoginLoadingState ? const CircularProgressIndicator() : buildLoginColumn(context)),
      ],
    );
  }

  Text buildIntroText(BuildContext context) {
    return Text(
      'Welcome To SahandaHalı',
      style: context.textTheme.headline4?.copyWith(color: Colors.grey.shade50),
      textAlign: TextAlign.center,
    );
  }

  Column buildLoginColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildEmailTextfield(context),
        context.emptySizedHeightBoxLow3x,
        buildPasswordTextfield(context),
        buildLoginButton(context)
      ],
    );
  }

  Padding buildLoginButton(BuildContext context) {
    return Padding(
      padding: context.paddingHighHorizontal,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green.shade900.withOpacity(0.70)),
          onPressed: () {
            context.read<LoginCubit>().loginUser();
          },
          child: const Text('Lets Go'),
        ),
      ),
    );
  }

  Padding buildEmailTextfield(BuildContext context) {
    return Padding(
      padding: context.paddingHighHorizontal,
      child: CustomTextFormField(
        controller: emailController,
        customColor: Colors.green.shade900,
        labelText: 'Email',
        textIcon: Icons.mail,
      ),
    );
  }

  Padding buildPasswordTextfield(BuildContext context) {
    return Padding(
      padding: context.paddingHighHorizontal,
      child: CustomTextFormField(
          controller: passwordController,
          customColor: Colors.green.shade900,
          labelText: 'Password',
          textIcon: Icons.vpn_key,
          suffixIcon: Icons.remove_red_eye,
          isObsecure: context.read<LoginCubit>().isVisible,
          onIconPress: () {
            context.read<LoginCubit>().changePasswordVisibility();
          }),
    );
  }
}
