import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  TextEditingController? controller;
  bool obsecure = false;
  TextInputType? textInputType = TextInputType.text;
  FormFieldValidator<String>? validator;
  FormFieldSetter<String>? onsaved;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hinttext;
  // int? minLines = 1;
  int? maxLines;
  AuthTextFormField(
      {Key? key,
      required this.controller,
      required this.obsecure,
      required this.validator,
      this.prefixIcon,
      required this.hinttext,
      this.suffixIcon,
      this.maxLines = 1,
      this.onsaved,
      // this.minLines,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      cursorColor: Colors.black,
      // minLines: minLines,
      maxLines: maxLines,
      keyboardType: textInputType,
      validator: validator,
      onSaved: onsaved,
      style: const TextStyle(
        fontFamily: 'Mikhak',
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        // isDense: true,

        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hinttext,
        hintStyle: TextStyle(
          fontFamily: 'Mikhak',
          color: Colors.grey.shade500,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        focusColor: Colors.transparent,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
