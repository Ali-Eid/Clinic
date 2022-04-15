import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/logic/auth/cubit/auth_cubit.dart';
import 'package:clinic/model/cities_model.dart';
import 'package:clinic/model/specialist_model.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/utils/validate.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class SignUpScreen extends StatelessWidget {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  int? cityID;
  int? destrictID;
  int? specialistID;

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit()
          ..getCities()
          ..getSpecialist(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SuccessAuthState) {
              CacheHelper.saveData(
                      key: 'token', value: state.model!.data!.token)
                  .then(
                (value) {
                  if (value!) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            animation = CurvedAnimation(
                                parent: animation,
                                curve: Curves.linearToEaseOut);
                            return ScaleTransition(
                              scale: animation,
                              alignment: Alignment.center,
                              child: child,
                            );
                          },
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const HomeScreen();
                          },
                        ),
                        (route) => false);
                  }
                },
              );
            }
            if (state is ErrorInputAuthState) {
              String s = '';
              if (state.errormodel!.data!.firstName != null) {
                s = '${state.errormodel!.data!.firstName.toString()}\n';
              }
              if (state.errormodel!.data!.lastName != null) {
                s += '${state.errormodel!.data!.lastName.toString()}\n';
              }
              if (state.errormodel!.data!.email != null) {
                s += '${state.errormodel!.data!.email.toString()}\n';
              }
              AwesomeDialog(
                context: context,
                dialogType: DialogType.ERROR,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Erro SignUp',
                desc: '',
                // btnCancelOnPress: () {},
                btnOkOnPress: () {
                  // Navigator.of(context).pop();
                },
              ).show();
            }
          },
          builder: (context, state) {
            return Scaffold(
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
                                height: 100,
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
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      // height: 35,
                                      // width: 100,
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 25,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: AuthTextFormField(
                                          controller: firstnameController,
                                          obsecure: false,
                                          validator: (value) {
                                            if (value!.length <= 2 ||
                                                !RegExp(validationName)
                                                    .hasMatch(value)) {
                                              return AppLocalizations.of(
                                                      context)!
                                                  .please_enter_valid_first_name;
                                            }
                                            return null;
                                          },
                                          hinttext:
                                              AppLocalizations.of(context)!
                                                  .first_name),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      // height: 35,
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 25,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: AuthTextFormField(
                                          controller: lastnameController,
                                          obsecure: false,
                                          validator: (value) {
                                            if (value!.length <= 2 ||
                                                !RegExp(validationName)
                                                    .hasMatch(value)) {
                                              return AppLocalizations.of(
                                                      context)!
                                                  .please_enter_valid_last_name;
                                            }
                                            return null;
                                          },
                                          hinttext:
                                              AppLocalizations.of(context)!
                                                  .last_name),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
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
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5,
                                child: SizedBox(
                                  // height: 35,
                                  width: double.infinity,
                                  child: DropdownButtonHideUnderline(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: DropdownButton<dynamic>(
                                        hint: TextUtils(
                                            text: AppLocalizations.of(context)!
                                                .city,
                                            color: Colors.grey.shade500,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        value: AuthCubit.get(context)
                                            .valueDropDowncity,
                                        items: AuthCubit.get(context)
                                                    .citiesModel ==
                                                null
                                            ? []
                                            : AuthCubit.get(context)
                                                .citiesModel!
                                                .data!
                                                .map((value) {
                                                return DropdownMenuItem<String>(
                                                    onTap: () {
                                                      AuthCubit.get(context)
                                                              .valueDropDowndistrict ==
                                                          null;
                                                      cityID = value.id;
                                                      AuthCubit.get(context)
                                                          .getDistrict(
                                                              id: value.id);
                                                    },
                                                    child: Text(value.name!),
                                                    value: value.name);
                                              }).toList(),
                                        onChanged: (val) {
                                          AuthCubit.get(context)
                                                  .valueDropDowndistrict ==
                                              null;
                                          AuthCubit.get(context)
                                              .changevalueDropdown(val);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5,
                                child: SizedBox(
                                  // height: 35,
                                  width: double.infinity,
                                  child: DropdownButtonHideUnderline(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: DropdownButton<dynamic>(
                                        hint: TextUtils(
                                            text: AppLocalizations.of(context)!
                                                .district,
                                            color: Colors.grey.shade500,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        value: AuthCubit.get(context)
                                            .valueDropDowndistrict,
                                        items: AuthCubit.get(context)
                                                    .disrictModel ==
                                                null
                                            ? []
                                            : AuthCubit.get(context)
                                                .disrictModel!
                                                .data!
                                                .map((value) {
                                                return DropdownMenuItem<String>(
                                                  child: Text(value.name!),
                                                  value: value.name,
                                                  onTap: () {
                                                    destrictID = value.id;
                                                  },
                                                );
                                              }).toList(),
                                        onChanged: (val) {
                                          AuthCubit.get(context)
                                              .changevalueDropdownDistrict(val);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5,
                                child: SizedBox(
                                  // height: 35,
                                  width: double.infinity,
                                  child: DropdownButtonHideUnderline(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: DropdownButton<dynamic>(
                                        hint: TextUtils(
                                            text: AppLocalizations.of(context)!
                                                .your_specialist,
                                            color: Colors.grey.shade500,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        value: AuthCubit.get(context)
                                            .valueDropDowncityspecilalist,
                                        items: AuthCubit.get(context)
                                                    .specialistModel ==
                                                null
                                            ? []
                                            : AuthCubit.get(context)
                                                .specialistModel!
                                                .data!
                                                .map((value) {
                                                return DropdownMenuItem<String>(
                                                    onTap: () {
                                                      specialistID = value.id;
                                                    },
                                                    child: Text(value.name!),
                                                    value: value.name);
                                              }).toList(),
                                        onChanged: (val) {
                                          AuthCubit.get(context)
                                              .changevalueDropdownspecilalist(
                                                  val);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            BuildCondition(
                              fallback: (context) => Center(
                                  child: Shimmer.fromColors(
                                      child: const ShimmerLoad(),
                                      baseColor: const Color(0Xff054F86),
                                      highlightColor: const Color(0Xff61C089))),
                              condition: state is! LoadingAuthState,
                              builder: (context) => Container(
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
                                  text: AppLocalizations.of(context)!.sign_up,
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      AuthCubit.get(context).signup(
                                        firstname: firstnameController.text,
                                        lastname: lastnameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        cityid: cityID!,
                                        districtid: destrictID!,
                                        specialistid: specialistID!,
                                      );
                                    }
                                  },
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/images/facebook.png'),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: TextUtils(
                                    text: AppLocalizations.of(context)!
                                        .sign_up_with_facebook,
                                    color: Colors.blue.shade900,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //     height: 60,
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
                  // Container(
                  //     height: 57,
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Image(
                  //       image: AssetImage('assets/images/88.png'),
                  //       fit: BoxFit.fill,
                  //     )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
