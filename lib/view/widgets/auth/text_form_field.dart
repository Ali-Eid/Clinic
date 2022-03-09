import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  TextEditingController? controller;
  bool obsecure = false;
  TextInputType? textInputType = TextInputType.text;
  FormFieldValidator<String>? validator;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hinttext;
  AuthTextFormField(
      {Key? key,
      required this.controller,
      required this.obsecure,
      required this.validator,
      this.prefixIcon,
      required this.hinttext,
      this.suffixIcon,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        focusColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
