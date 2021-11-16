import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahanda_hali/core/components/textfield/custom_textformfield.dart';
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
      create: (context) => LoginCubit(emailController, passwordController, formKey),
      child: Scaffold(
        body: buildContainer(context),
      ),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
      child: buildComponentsColumn(context),
    );
  }

  Column buildComponentsColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly
      ,
      children: [
        Text('Welcome To SahandaHalı', style: context.textTheme.headline4?.copyWith(color: Colors.grey.shade50),
          textAlign: TextAlign.center,
        ),
        Form(key: formKey, child: buildLoginColumn(context)),

      ],
    );
  }

  Column buildLoginColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildEmailTextfield(context),
        context.emptySizedHeightBoxLow3x,
        buildPasswordTextfield(context),
        Padding(
          padding: context.paddingHighHorizontal,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green.shade900.withOpacity(0.70)),
              onPressed: () {
                //do something
              },
              child: const Text('Lets Go'),
            ),
          ),
        )
      ],
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
      ),
    );
  }
}
