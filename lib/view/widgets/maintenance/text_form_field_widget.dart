import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  var controller = TextEditingController();
  String text;
  String fieldemptymsg;
  Widget? suffixIcon;
  double? height;
  int? minLines = 1;
  int? maxLines = 2;
  FormFieldSetter<String>? onsaved;
  TextInputType? textinputType;
  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.text,
      this.height,
      required this.fieldemptymsg,
      this.maxLines,
      this.minLines,
      this.onsaved,
      this.textinputType = TextInputType.text,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black38, blurRadius: 25, offset: Offset(0, 10))
      ]),
      child: AuthTextFormField(
          onsaved: onsaved,
          textInputType: textinputType,
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 100,
            // height: 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0Xff054F86),
                    Color(0Xff61C089),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: TextUtils(
                text: text,
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          controller: controller,
          // maxLines: 1,
          // minLines: 1,
          obsecure: false,
          suffixIcon: suffixIcon,
          validator: (value) {
            if (value!.isEmpty) {
              return fieldemptymsg;
            }
            return null;
          },
          hinttext: ''),
    );
  }
}
