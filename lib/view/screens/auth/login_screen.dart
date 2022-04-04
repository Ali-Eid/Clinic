// import 'package:clinic/logic/auth/log_in/cubit/login_cubit.dart';
import 'package:clinic/logic/auth/cubit/auth_cubit.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/view/screens/auth/signup_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          CacheHelper.saveData(
                  key: 'token',
                  value: AuthCubit.get(context).usermodel!.data!.token)
              .then((value) {
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.linearToEaseOut);
                    return ScaleTransition(
                      scale: animation,
                      alignment: Alignment.center,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return HomeScreen();
                  },
                ),
                (route) => false);
          });
        }
        if (state is ErrorLoginState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Error Login',
            desc: '${state.error}',
            // btnCancelOnPress: () {},
            btnOkOnPress: () {
              // Navigator.of(context).pop();
            },
          ).show();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                                      return 'email is not valid';
                                    }
                                    return null;
                                  },
                                  hinttext: ' your email'),
                            ),
                          ),
                          SizedBox(
                            height: 8,
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
                            height: 25,
                          ),
                          state is LoadingLoginState
                              ? Center(
                                  child: Container(
                                    height: 40,
                                    color: Colors.transparent,
                                    child: CircularProgressIndicator(
                                      color: Colors.green.shade400,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 130,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.green.shade300,
                                          Colors.blue.shade900,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight),
                                  ),
                                  child: AuthButton(
                                    text: 'Sign in',
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        AuthCubit.get(context).submitlogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    color: Colors.transparent,
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
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
                          ),
                          // SizedBox(
                          //   height: 40,
                          // ),
                          // Container(
                          //     height: 50,
                          //     width: MediaQuery.of(context).size.width,
                          //     child: Image(
                          //       image: AssetImage('assets/images/88.png'),
                          //       fit: BoxFit.fill,
                          //     )),
                        ],
                      ),
                    ),
                  ),
                ),
                FotterWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
