import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/maintenance_request_model.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/maintenance/text_form_field_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class ConfirmOrderClean extends StatelessWidget {
  ConfirmOrderClean({Key? key, this.description, this.type}) : super(key: key);
  String? description;
  String? type;
  TextEditingController detailsController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController destrictController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  int? cityID = 0;
  int? destrictID = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is SuccessRequestCleanClinicState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.BOTTOMSLIDE,
              title: AppLocalizations.of(context)!.order_request,
              desc: AppLocalizations.of(context)!.status,
              // btnCancelOnPress: () {},
              btnOkOnPress: () {
                Navigator.of(context).pushAndRemoveUntil(
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
              },
            ).show();
          }
          if (state is ErrorRequestCleanClinicState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: AppLocalizations.of(context)!.order_request,
              desc: state.error,
              // btnCancelOnPress: () {},
              btnOkOnPress: () {
                // Navigator.of(context).pop();
              },
            ).show();
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            drawer: const DrawerPage(),
            appBar: AppBar(
              flexibleSpace: const HeaderWidget(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                );
              }),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  NotificationSearchTitle(
                    text: AppLocalizations.of(context)!.confirm_request,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.10,
                          ),
                          TextFieldWidget(
                            textinputType: TextInputType.number,
                            suffixIcon:
                                Icon(Icons.star, color: Colors.grey.shade400),
                            controller: phoneController,
                            text: AppLocalizations.of(context)!.phone_number,
                            fieldemptymsg: AppLocalizations.of(context)!
                                .phone_number_validate,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0Xff054F86),
                                          Color(0Xff61C089),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: TextUtils(
                                      text: AppLocalizations.of(context)!.city,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Container(
                                    // height: 35,
                                    // width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: DropdownButton<dynamic>(
                                          elevation: 1,

                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          // alignment: Alignment.center,
                                          hint: TextUtils(
                                              text:
                                                  AppLocalizations.of(context)!
                                                      .your_city,
                                              color: Colors.grey.shade500,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          value: HomeCubit.get(context)
                                              .valueDropDowncity,
                                          items: HomeCubit.get(context)
                                                      .citiesModel ==
                                                  null
                                              ? []
                                              : HomeCubit.get(context)
                                                  .citiesModel!
                                                  .data!
                                                  .map((value) {
                                                  return DropdownMenuItem<
                                                          String>(
                                                      onTap: () {
                                                        cityID = value.id;
                                                        HomeCubit.get(context)
                                                            .getDistrict(
                                                                id: value.id);
                                                      },
                                                      child: Text(value.name!),
                                                      value: value.name);
                                                }).toList(),
                                          onChanged: (val) {
                                            HomeCubit.get(context)
                                                .changevalueDropdown(val);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // TextFieldWidget(
                          //   suffixIcon:
                          //       Icon(Icons.star, color: Colors.grey.shade400),
                          //   controller: destrictController,
                          //   text: '${getLang(context, 'district')}',
                          //   fieldemptymsg: 'District Number must not be empty',
                          // ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0Xff054F86),
                                          Color(0Xff61C089),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: TextUtils(
                                      text: AppLocalizations.of(context)!
                                          .district,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    // height: 35,
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: DropdownButton<dynamic>(
                                          hint: TextUtils(
                                              text:
                                                  AppLocalizations.of(context)!
                                                      .your_district,
                                              color: Colors.grey.shade500,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          value: HomeCubit.get(context)
                                              .valueDropDowndistrict,
                                          items: HomeCubit.get(context)
                                                      .disrictModel ==
                                                  null
                                              ? []
                                              : HomeCubit.get(context)
                                                  .disrictModel!
                                                  .data!
                                                  .map((value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    child: Text(value.name!),
                                                    value: value.name,
                                                    onTap: () {
                                                      destrictID = value.id;
                                                    },
                                                  );
                                                }).toList(),
                                          onChanged: (val) {
                                            HomeCubit.get(context)
                                                .changevalueDropdownDistrict(
                                                    val);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            // height: height,
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 25,
                                  offset: Offset(0, 10))
                            ]),
                            child: AuthTextFormField(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 100),
                                  child: Icon(Icons.star,
                                      color: Colors.grey.shade400),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 100,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.center,
                                    width: 100,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0Xff054F86),
                                            Color(0Xff61C089),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: TextUtils(
                                        text: AppLocalizations.of(context)!
                                            .details_address,
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                controller: detailsController,
                                maxLines: 5,
                                // minLines: 7,
                                obsecure: false,
                                // suffixIcon: suffixIcon,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .details_address_validate;
                                  }
                                  return null;
                                },
                                hinttext: ''),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BuildCondition(
                                fallback: (context) => Center(
                                    child: Shimmer.fromColors(
                                        child: const ShimmerLoad(),
                                        baseColor: const Color(0Xff054F86),
                                        highlightColor:
                                            const Color(0Xff61C089))),
                                // Center(
                                //   child: SizedBox(
                                //       // width: 130,
                                //       height: 40,
                                //       child: EasyLoader(
                                //         image: const AssetImage(
                                //           'assets/images/logo.png',
                                //         ),
                                //         backgroundColor: Colors.grey.shade300,
                                //         // iconSize: 20,
                                //         iconColor: const Color(0Xff054F86),
                                //       )),
                                // ),
                                condition:
                                    state is! LoadingRequestMaintenanceState,
                                builder: (context) => Container(
                                  width: 130,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0Xff054F86),
                                          Color(0Xff61C089),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight),
                                  ),
                                  child: AuthButton(
                                    text: AppLocalizations.of(context)!
                                        .confirm_btn,
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        HomeCubit.get(context)
                                            .requestcleanclinic(
                                                city: cityID!,
                                                district: destrictID!,
                                                type: type!,
                                                moblilenum:
                                                    phoneController.text,
                                                description: description ?? '',
                                                details:
                                                    detailsController.text);
                                      }
                                    },
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
