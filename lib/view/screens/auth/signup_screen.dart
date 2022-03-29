import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  final List<String> _items = ['+1', '+42', '+666', '+17', '+228'];
  TextEditingController _phoneNumberController = TextEditingController();
  String? _value;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/xxxxxxx (1).png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: double.infinity,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextUtils(
                          text: 'عيادتي',
                          color: Colors.blue.shade900,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      TextUtils(
                          text: 'My clinic',
                          color: Colors.blue.shade900,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          // height: 35,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 25,
                                offset: Offset(0, 10))
                          ]),
                          child: AuthTextFormField(
                              controller: emailController,
                              obsecure: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please Enter Valid Email';
                                }
                                return null;
                              },
                              hinttext: ' your email'),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          // height: 35,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 25,
                                offset: Offset(0, 10))
                          ]),
                          child: AuthTextFormField(
                              controller: passwordController,
                              obsecure: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password is too short';
                                }
                                return null;
                              },
                              hinttext: ' your password'),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          // height: 35,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 25,
                                offset: Offset(0, 10))
                          ]),
                          child: AuthTextFormField(
                              controller: addressController,
                              obsecure: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'address is too short';
                                }
                                return null;
                              },
                              hinttext: ' your address'),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                          child: Container(
                            // height: 35,
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: DropdownButton<String>(
                                  hint: TextUtils(
                                      text: 'your specialty',
                                      color: Colors.grey.shade500,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  value: _value,
                                  items: _items.map((value) {
                                    return DropdownMenuItem<String>(
                                        child: Text(value), value: value);
                                  }).toList(),
                                  onChanged: (val) {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            Colors.green.shade300,
                            Colors.blue.shade900,
                          ], begin: Alignment.topLeft, end: Alignment.topRight),
                        ),
                        child: AuthButton(
                          text: 'Sign in',
                          onPressed: () {
                            formkey.currentState!.validate();
                          },
                          color: Colors.transparent,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/facebook.png'),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: TextUtils(
                              text: 'Or sign up with facebook',
                              color: Colors.blue.shade900,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: AssetImage('assets/images/88.png'),
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //     height: 57,
            //     width: MediaQuery.of(context).size.width,
            //     child: Image(
            //       image: AssetImage('assets/images/88.png'),
            //       fit: BoxFit.fill,
            //     )),
          ],
        ),
      ),
    );
  }
}
