import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  final List<String> _items = ['+1', '+42', '+666', '+17', '+228'];
  TextEditingController _phoneNumberController = TextEditingController();
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
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
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                child: Container(
                  height: 35,
                  child: AuthTextFormField(
                      controller: emailController,
                      obsecure: false,
                      validator: (value) {},
                      hinttext: ' your email'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                child: Container(
                  height: 35,
                  child: AuthTextFormField(
                      controller: emailController,
                      obsecure: false,
                      validator: (value) {},
                      hinttext: ' your password'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                child: Container(
                  height: 35,
                  child: AuthTextFormField(
                      controller: emailController,
                      obsecure: false,
                      validator: (value) {},
                      hinttext: ' your address'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                child: Container(
                  height: 35,
                  width: double.infinity,
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: DropdownButton<String>(
                        hint: TextUtils(
                            text: 'your specialty',
                            color: Colors.grey.shade400,
                            fontSize: 16,
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
                  Colors.green,
                  Colors.blue.shade900,
                ], begin: Alignment.topLeft, end: Alignment.topRight),
              ),
              child: AuthButton(
                text: 'Sign in',
                onPressed: () {},
                color: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 40,
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
            )
          ],
        ),
      ),
    );
  }
}
