import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/maintenance_request_model.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/maintenance/text_form_field_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOrderClean extends StatelessWidget {
  ConfirmOrderClean({Key? key, this.description, this.type}) : super(key: key);
  String? description;
  String? type;
  TextEditingController detailsController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController destrictController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();

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
              title: 'Clean Clinic Request',
              desc: 'Success',
              // btnCancelOnPress: () {},
              btnOkOnPress: () {
                Navigator.of(context).pushAndRemoveUntil(
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
              },
            ).show();
          }
          if (state is ErrorRequestCleanClinicState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Clean Clinic Request',
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
            drawer: DrawerPage(),
            appBar: AppBar(
              flexibleSpace: HeaderWidget(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
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
                    text: '${getLang(context, "confirm_request")}',
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
                            text: '${getLang(context, 'phone_number')}',
                            fieldemptymsg: 'Phone number  must not be empty',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            suffixIcon:
                                Icon(Icons.star, color: Colors.grey.shade400),
                            controller: cityController,
                            text: '${getLang(context, 'city')}',
                            fieldemptymsg: 'city must not be empty',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            suffixIcon:
                                Icon(Icons.star, color: Colors.grey.shade400),
                            controller: destrictController,
                            text: '${getLang(context, 'district')}',
                            fieldemptymsg: 'District Number must not be empty',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            // height: height,
                            decoration: BoxDecoration(boxShadow: [
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
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0Xff054F86),
                                            Color(0Xff61C089),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: TextUtils(
                                        text:
                                            '${getLang(context, 'details_address')}',
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
                                    return 'Description must not be empty';
                                  }
                                  return null;
                                },
                                hinttext: ''),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BuildCondition(
                                fallback: (context) => Center(
                                  child: Container(
                                    // width: 130,
                                    height: 40,
                                    child: CircularProgressIndicator(
                                      color: Colors.green.shade400,
                                    ),
                                  ),
                                ),
                                condition:
                                    state is! LoadingRequestMaintenanceState,
                                builder: (context) => Container(
                                  width: 130,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0Xff054F86),
                                          Color(0Xff61C089),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight),
                                  ),
                                  child: AuthButton(
                                    text: '${getLang(context, 'confirm_btn')}',
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        HomeCubit.get(context)
                                            .requestcleanclinic(
                                                type: type!,
                                                moblilenum:
                                                    phoneController.text,
                                                description: description!,
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
