import 'package:clinic/view/screens/auth/signup_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
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
                height: 50,
              ),
              TextUtils(
                  text: 'Sign In to your account',
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 15,
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
                        hinttext: ' your name'),
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
                        controller: passwordController,
                        obsecure: true,
                        validator: (value) {},
                        hinttext: ' your password'),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
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
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  color: Colors.transparent,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: TextUtils(
                  text: 'Or create account',
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 30,
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
                      text: 'Or sign in with facebook',
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
      ),
    );
  }
}
