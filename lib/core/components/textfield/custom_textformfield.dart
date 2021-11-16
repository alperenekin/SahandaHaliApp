import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? customColor;
  final String? labelText;
  final IconData? textIcon;
  const CustomTextFormField({Key? key, @required this.controller, this.customColor, this.labelText, this.textIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => (value ?? '').length > 6 ? null : 'must be longer than 6 chars',
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(textIcon ?? Icons.mail,color: customColor ?? Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.70),
        labelText: labelText ?? '',
        labelStyle: TextStyle(color: customColor ?? Colors.white),
        border: _buildOutlineInputBorder(),
        focusedBorder:_buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide:  BorderSide(color: customColor ?? Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      );
  }
}
