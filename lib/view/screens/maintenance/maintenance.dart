import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/maintenance_request_model.dart';
import 'package:clinic/view/screens/confirm/confirm_screen.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/maintenance/text_form_field_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Maintenance extends StatelessWidget {
  Maintenance({Key? key}) : super(key: key);
  TextEditingController DeviceController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController serialController = TextEditingController();
  TextEditingController DescController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  MaintenanceReq? maintenancereq;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
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
              body: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            NotificationSearchTitle(
                              text:
                                  '${AppLocalizations.of(context)!.maintenance}',
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                  ),
                                  TextFieldWidget(
                                    suffixIcon: Icon(Icons.star,
                                        color: Colors.grey.shade400),
                                    controller: DeviceController,
                                    text:
                                        '${AppLocalizations.of(context)!.device}',
                                    fieldemptymsg: 'Device  must not be empty',
                                    onsaved: (value) {
                                      maintenancereq!.device = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFieldWidget(
                                    suffixIcon: Icon(Icons.star,
                                        color: Colors.grey.shade400),
                                    controller: typeController,
                                    text:
                                        '${AppLocalizations.of(context)!.type}',
                                    fieldemptymsg: 'type must not be empty',
                                    onsaved: (value) {
                                      maintenancereq!.type = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFieldWidget(
                                    suffixIcon: Icon(Icons.star,
                                        color: Colors.grey.shade400),
                                    controller: serialController,
                                    text:
                                        '${AppLocalizations.of(context)!.serial_num}',
                                    fieldemptymsg:
                                        'Serial Number must not be empty',
                                    onsaved: (value) {
                                      maintenancereq!.serialnum = value;
                                    },
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
                                          padding: const EdgeInsets.only(
                                              bottom: 150),
                                          child: Icon(Icons.star,
                                              color: Colors.grey.shade400),
                                        ),
                                        onsaved: (value) {
                                          maintenancereq!.descriptipn = value;
                                        },
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 150,
                                          ),
                                          child: Container(
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
                                                    '${AppLocalizations.of(context)!.description}',
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        controller: DescController,
                                        maxLines: 7,
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
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                        condition: state
                                            is! LoadingRequestMaintenanceState,
                                        builder: (context) => Container(
                                          width: 130,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0Xff054F86),
                                                Color(0Xff61C089),
                                              ],
                                              // begin: Alignment.topLeft,
                                              // end: Alignment.topRight,
                                            ),
                                          ),
                                          child: AuthButton(
                                            text:
                                                '${AppLocalizations.of(context)!.confirm}',
                                            onPressed: () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) => ConfirmScreen(
                                                            device:
                                                                DeviceController
                                                                    .text,
                                                            description:
                                                                DescController
                                                                    .text,
                                                            serialnum:
                                                                serialController
                                                                    .text,
                                                            type: typeController
                                                                .text)));
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  FotterWidget(
                    model: HomeCubit.get(context).contactInfoModel!.data,
                  )
                ],
              )),
        );
      },
    );
  }
}

// Column(
//   // mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Stack(
//       alignment: Alignment.topRight,
//       children: [
//         Material(
//           elevation: 15,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.80,
//             height: 40,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.all(Radius.circular(20))),
//             child: AuthTextFormField(
//               controller: DescController,
//               obsecure: false,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'email is not valid';
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           width: 110,
//           height: 40,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.green.shade300,
//                   Colors.blue.shade900,
//                 ],
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: TextUtils(
//               text: 'نوع الجهاز',
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 20,
//     ),
//     Stack(
//       alignment: Alignment.topRight,
//       children: [
//         Material(
//           elevation: 15,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.80,
//             height: 40,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.all(Radius.circular(20))),
//             child: AuthTextFormField(
//               controller: DescController,
//               obsecure: false,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'email is not valid';
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           width: 110,
//           height: 40,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.green.shade300,
//                   Colors.blue.shade900,
//                 ],
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: TextUtils(
//               text: 'الطراز',
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 20,
//     ),
//     Stack(
//       alignment: Alignment.topRight,
//       children: [
//         Material(
//           elevation: 15,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.80,
//             height: 40,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.all(Radius.circular(20))),
//             child: AuthTextFormField(
//               controller: DescController,
//               obsecure: false,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'email is not valid';
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           width: 110,
//           height: 40,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.green.shade300,
//                   Colors.blue.shade900,
//                 ],
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: TextUtils(
//               text: 'الرقم التسلسلي',
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 20,
//     ),
//     Stack(
//       alignment: Alignment.topRight,
//       children: [
//         Material(
//           elevation: 15,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.80,
//             height: 100,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.all(Radius.circular(20))),
//             child: AuthTextFormField(
//               controller: DescController,
//               obsecure: false,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'email is not valid';
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           width: 110,
//           height: 40,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.green.shade300,
//                   Colors.blue.shade900,
//                 ],
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: TextUtils(
//               text: 'وصف المشكلة',
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 20,
//     ),
//     Stack(
//       alignment: Alignment.topRight,
//       children: [
//         Material(
//           elevation: 15,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.80,
//             height: 40,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.all(Radius.circular(20))),
//             child: AuthTextFormField(
//               controller: DescController,
//               obsecure: false,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'email is not valid';
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           width: 110,
//           height: 40,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.green.shade300,
//                   Colors.blue.shade900,
//                 ],
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: TextUtils(
//               text: 'رقم للتواصل',
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 50,
//     ),
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Container(
//           width: 130,
//           height: 35,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             gradient: LinearGradient(colors: [
//               Colors.green.shade300,
//               Colors.blue.shade900,
//             ], begin: Alignment.topLeft, end: Alignment.topRight),
//           ),
//           child: AuthButton(
//             text: 'confirm',
//             onPressed: () {},
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
