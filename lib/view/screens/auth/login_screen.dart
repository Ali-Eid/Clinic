// import 'package:clinic/logic/auth/log_in/cubit/login_cubit.dart';
import 'package:clinic/logic/auth/cubit/auth_cubit.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/utils/validate.dart';
import 'package:clinic/view/screens/auth/signup_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/footer_auth.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()
        ..getCities()
        ..getSpecialist(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            CacheHelper.saveData(
                    key: 'token', value: state.loginmodel!.data!.token)
                .then((value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 1),
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
                      return const HomeScreen();
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
                flexibleSpace: const Image(
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
                              child: const Image(
                                image: AssetImage('assets/images/logo.png'),
                                width: double.infinity,
                                height: 150,
                              ),
                            ),
                            const SizedBox(
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
                            const SizedBox(
                              height: 50,
                            ),
                            TextUtils(
                                text: AppLocalizations.of(context)!
                                    .sign_in_to_your_account,
                                color: Colors.blue.shade900,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Container(
                                // height: 35,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 25,
                                      offset: Offset(0, 10))
                                ]),
                                child: AuthTextFormField(
                                    controller: emailController,
                                    obsecure: false,
                                    validator: (value) {
                                      if (value!.length <= 2 ||
                                          !RegExp(validationEmail)
                                              .hasMatch(value)) {
                                        return AppLocalizations.of(context)!
                                            .please_enter_valid_email;
                                      }

                                      return null;
                                    },
                                    hinttext:
                                        ' ${AppLocalizations.of(context)!.email}'),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Container(
                                // height: 35,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 25,
                                      offset: Offset(0, 10))
                                ]),
                                child: AuthTextFormField(
                                    controller: passwordController,
                                    obsecure:
                                        AuthCubit.get(context).isvisibility,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          AuthCubit.get(context)
                                              .changeobsecurepassword();
                                        },
                                        icon:
                                            AuthCubit.get(context).isvisibility
                                                ? const Icon(Icons.visibility,
                                                    size: 20,
                                                    color: Colors.grey)
                                                : const Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.grey,
                                                    size: 20,
                                                  )),
                                    validator: (value) {
                                      if (value!.length < 6) {
                                        return AppLocalizations.of(context)!
                                            .password_valid;
                                      }
                                      return null;
                                    },
                                    hinttext:
                                        ' ${AppLocalizations.of(context)!.password}'),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            state is LoadingLoginState
                                ? Center(
                                    child: Container(
                                      height: 40,
                                      color: Colors.transparent,
                                      child: Center(
                                          child: Shimmer.fromColors(
                                              child: const ShimmerLoad(),
                                              baseColor:
                                                  const Color(0Xff054F86),
                                              highlightColor:
                                                  const Color(0Xff61C089))),
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
                                      text:
                                          AppLocalizations.of(context)!.sign_in,
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          AuthCubit.get(context).submitlogin(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      },
                                      color: Colors.transparent,
                                    ),
                                  ),
                            const SizedBox(
                              height: 15,
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
                                text: AppLocalizations.of(context)!
                                    .create_account,
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     const Image(
                            //       image:
                            //           AssetImage('assets/images/facebook.png'),
                            //     ),
                            //     const SizedBox(
                            //       width: 3,
                            //     ),
                            //     TextButton(
                            //       onPressed: () {
                            //         print(
                            //             '${AppLocalizations.supportedLocales}');
                            //       },
                            //       child: TextUtils(
                            //         text: AppLocalizations.of(context)!
                            //             .sign_in_with_facebook,
                            //         color: Colors.blue.shade900,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            //     )
                            //   ],
                            // ),
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
                  FotterAuthWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
