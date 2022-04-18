import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/elevated_button_gradient.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/maintenance/text_form_field_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateInfoScreen extends StatelessWidget {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  int? cityID = 0;
  int? destrictID = 0;
  UpdateInfoScreen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
        if (state is SuccessUpdateUserInfoState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: AppLocalizations.of(context)!.update_Info,
            desc: AppLocalizations.of(context)!.success_update_info,
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

        if (state is ErrorUserInfoState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: AppLocalizations.of(context)!.update_Info,
            desc: state.error,
            // btnCancelOnPress: () {},
            btnOkOnPress: () {
              // Navigator.of(context).pop();
            },
          ).show();
        }
      }, builder: (context, state) {
        firstnamecontroller.text =
            HomeCubit.get(context).model!.data!.firstName!;
        lastnamecontroller.text = HomeCubit.get(context).model!.data!.lastName!;
        emailcontroller.text = HomeCubit.get(context).model!.data!.email!;
        phoneController.text =
            HomeCubit.get(context).model!.data!.mobileNumber!;
        return Scaffold(
          // drawer: DrawerPage(
          //   text:
          //       '${HomeCubit.get(context).model?.data?.firstName ?? ''} ${HomeCubit.get(context).model?.data?.lastName ?? ''} ',
          // ),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            flexibleSpace: const HeaderWidget(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            // // leading: Builder(builder: (context) {
            // //   return Padding(
            // //     padding: const EdgeInsets.only(top: 20),
            // //     child: IconButton(
            // //       onPressed: () => Scaffold.of(context).openDrawer(),
            // //       icon: const Icon(
            // //         Icons.menu,
            // //         color: Colors.black,
            // //       ),
            // //     ),
            //   );
            // }),
          ),
          body: Form(
            key: formkey,
            child: Column(
              children: [
                NotificationSearchTitle(
                  text: 'your information',
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage:
                          HomeCubit.get(context).profileImage != null
                              ? Image.file(HomeCubit.get(context).profileImage!)
                                  .image
                              : const CachedNetworkImageProvider(
                                  'https://img.freepik.com/free-vector/error-404-found-glitch-effect_8024-4.jpg',
                                ),

                      // backgroundColor: Colors.transparent,
                      // child:
                      //  HomeCubit.get(context).model?.data!.photo != null
                      //     ? CachedNetworkImage(
                      //         height: 75,
                      //         // fit: BoxFit.cover,
                      //         width: double.infinity,
                      //         imageUrl: HomeCubit.get(context).model!.data!.photo!,
                      //         placeholder: (context, url) => Center(
                      //           child: CircularProgressIndicator(
                      //               color: Colors.green.shade400),
                      //         ),

                      //         errorWidget: (context, url, error) =>
                      //             const Icon(Icons.error),
                      //       )
                      //     :
                      // HomeCubit.get(context).profileImage != null
                      //     ? Container(
                      //         //elese show image here
                      //         child: SizedBox(
                      //             height: 150,
                      //             child: Image.file(HomeCubit.get(context)
                      //                 .profileImage!) //load image from file
                      //             ))
                      //     : CachedNetworkImage(
                      //         height: 50,
                      //         fit: BoxFit.cover,
                      //         width: double.infinity,
                      //         imageUrl:
                      //             'https://img.freepik.com/free-vector/error-404-found-glitch-effect_8024-4.jpg',
                      //         placeholder: (context, url) => Center(
                      //           child: CircularProgressIndicator(
                      //               color: Colors.green.shade400),
                      //         ),
                      //         errorWidget: (context, url, error) =>
                      //             const Icon(Icons.error),
                      //       ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                          onPressed: () {
                            HomeCubit.get(context).changeProfileImage();
                            print(
                                '${HomeCubit.get(context).profileImage?.path}');
                          },
                          icon: const Icon(
                            Icons.photo,
                            color: Colors.white,
                          )),
                      radius: 20,
                      backgroundColor: const Color(0Xff61C089),
                    )
                  ],
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.18,
                //   decoration: const BoxDecoration(
                //     color: Colors.red,
                //     // borderRadius: BorderRadius.all(Radius.circular(30)),
                //     shape: BoxShape.circle,
                //   ),
                //   child:
                // HomeCubit.get(context).model?.data!.photo != null
                //     ? CachedNetworkImage(
                //         height: 75,
                //         // fit: BoxFit.cover,
                //         width: double.infinity,
                //         imageUrl: HomeCubit.get(context).model!.data!.photo!,
                //         placeholder: (context, url) => Center(
                //           child: CircularProgressIndicator(
                //               color: Colors.green.shade400),
                //         ),

                //         errorWidget: (context, url, error) =>
                //             const Icon(Icons.error),
                //       )
                //     :

                // ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFieldWidget(
                        suffixIcon:
                            Icon(Icons.star, color: Colors.grey.shade400),
                        controller: firstnamecontroller,
                        text: AppLocalizations.of(context)!.first_name,
                        fieldemptymsg: AppLocalizations.of(context)!
                            .please_enter_valid_first_name,
                        // onsaved: (value) {
                        //   maintenancereq!.device = value;
                        // },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        suffixIcon:
                            Icon(Icons.star, color: Colors.grey.shade400),
                        controller: lastnamecontroller,
                        text: AppLocalizations.of(context)!.last_name,
                        fieldemptymsg: AppLocalizations.of(context)!
                            .please_enter_valid_first_name,
                        // onsaved: (value) {
                        //   maintenancereq!.device = value;
                        // },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        textinputType: TextInputType.number,
                        suffixIcon:
                            Icon(Icons.star, color: Colors.grey.shade400),
                        controller: phoneController,
                        text: AppLocalizations.of(context)!.phone_number,
                        fieldemptymsg:
                            AppLocalizations.of(context)!.phone_number_validate,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      //   elevation: 5,
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         alignment: Alignment.center,
                      //         width: 100,
                      //         height: 50,
                      //         decoration: const BoxDecoration(
                      //             gradient: LinearGradient(
                      //               colors: [
                      //                 Color(0Xff054F86),
                      //                 Color(0Xff61C089),
                      //               ],
                      //             ),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30))),
                      //         child: TextUtils(
                      //             text: AppLocalizations.of(context)!.city,
                      //             color: Colors.white,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           // height: 35,
                      //           // width: double.infinity,
                      //           child: DropdownButtonHideUnderline(
                      //             child: Container(
                      //               padding:
                      //                   const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      //               child: DropdownButton<dynamic>(
                      //                 elevation: 1,

                      //                 icon: const Icon(Icons.arrow_drop_down),
                      //                 // alignment: Alignment.center,
                      //                 hint: TextUtils(
                      //                     text: HomeCubit.get(context)
                      //                         .model!
                      //                         .data!
                      //                         .address!
                      //                         .city!
                      //                         .name!,
                      //                     color: Colors.black,
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //                 value: HomeCubit.get(context)
                      //                     .valueDropDowncity,
                      //                 items: HomeCubit.get(context).citiesModel ==
                      //                         null
                      //                     ? []
                      //                     : HomeCubit.get(context)
                      //                         .citiesModel!
                      //                         .data!
                      //                         .map((value) {
                      //                         return DropdownMenuItem<String>(
                      //                             onTap: () {
                      //                               cityID = value.id;
                      //                               HomeCubit.get(context)
                      //                                   .getDistrict(
                      //                                       id: value.id);
                      //                             },
                      //                             child: Text(value.name!),
                      //                             value: value.name);
                      //                       }).toList(),
                      //                 onChanged: (val) {
                      //                   HomeCubit.get(context)
                      //                       .changevalueDropdown(val);
                      //                 },
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      //   elevation: 5,
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         alignment: Alignment.center,
                      //         width: 100,
                      //         height: 50,
                      //         decoration: const BoxDecoration(
                      //             gradient: LinearGradient(
                      //               colors: [
                      //                 Color(0Xff054F86),
                      //                 Color(0Xff61C089),
                      //               ],
                      //             ),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30))),
                      //         child: TextUtils(
                      //             text: AppLocalizations.of(context)!.district,
                      //             color: Colors.white,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //       Expanded(
                      //         child: SizedBox(
                      //           // height: 35,
                      //           width: double.infinity,
                      //           child: DropdownButtonHideUnderline(
                      //             child: Container(
                      //               padding:
                      //                   const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      //               child: DropdownButton<dynamic>(
                      //                 hint: TextUtils(
                      //                     text: HomeCubit.get(context)
                      //                         .model!
                      //                         .data!
                      //                         .address!
                      //                         .district!
                      //                         .name!,
                      //                     color: Colors.black,
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //                 value: HomeCubit.get(context)
                      //                     .valueDropDowndistrict,
                      //                 items:
                      //                     HomeCubit.get(context).disrictModel ==
                      //                             null
                      //                         ? []
                      //                         : HomeCubit.get(context)
                      //                             .disrictModel!
                      //                             .data!
                      //                             .map((value) {
                      //                             return DropdownMenuItem<String>(
                      //                               child: Text(value.name!),
                      //                               value: value.name,
                      //                               onTap: () {
                      //                                 destrictID = value.id;
                      //                               },
                      //                             );
                      //                           }).toList(),
                      //                 onChanged: (val) {
                      //                   HomeCubit.get(context)
                      //                       .changevalueDropdownDistrict(val);
                      //                 },
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      //   elevation: 5,
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         alignment: Alignment.center,
                      //         width: 100,
                      //         height: 50,
                      //         decoration: const BoxDecoration(
                      //             gradient: LinearGradient(
                      //               colors: [
                      //                 Color(0Xff054F86),
                      //                 Color(0Xff61C089),
                      //               ],
                      //             ),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30))),
                      //         child: TextUtils(
                      //             text: 'specialist',
                      //             color: Colors.white,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //       Expanded(
                      //         child: SizedBox(
                      //           // height: 35,
                      //           width: double.infinity,
                      //           child: DropdownButtonHideUnderline(
                      //             child: Container(
                      //               padding:
                      //                   const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      //               child: DropdownButton<dynamic>(
                      //                 hint: TextUtils(
                      //                     text: HomeCubit.get(context)
                      //                             .model!
                      //                             .data!
                      //                             .specialty
                      //                             ?.name ??
                      //                         '',
                      //                     color: Colors.black,
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //                 value: HomeCubit.get(context)
                      //                     .valueDropDowndistrict,
                      //                 items:
                      //                     HomeCubit.get(context).disrictModel ==
                      //                             null
                      //                         ? []
                      //                         : HomeCubit.get(context)
                      //                             .disrictModel!
                      //                             .data!
                      //                             .map((value) {
                      //                             return DropdownMenuItem<String>(
                      //                               child: Text(value.name!),
                      //                               value: value.name,
                      //                               onTap: () {
                      //                                 destrictID = value.id;
                      //                               },
                      //                             );
                      //                           }).toList(),
                      //                 onChanged: (val) {
                      //                   HomeCubit.get(context)
                      //                       .changevalueDropdownDistrict(val);
                      //                 },
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ButtonGradientWidget(
                    color: Colors.transparent,
                    text: AppLocalizations.of(context)!.update,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        HomeCubit.get(context).updateinfo(
                            firstname: firstnamecontroller.text,
                            lastname: lastnamecontroller.text,
                            email: emailcontroller.text,
                            mobilenum: phoneController.text,
                            specialistid:
                                '${HomeCubit.get(context).model!.data!.specialtyId}');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
