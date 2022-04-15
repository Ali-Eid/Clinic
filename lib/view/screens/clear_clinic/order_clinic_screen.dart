import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/maintenance_request_model.dart';
import 'package:clinic/view/screens/clear_clinic/order_clinic_confirm.dart';
import 'package:clinic/view/screens/confirm/confirm_screen.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/maintenance/text_form_field_widget.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderClinic extends StatelessWidget {
  String? type;
  OrderClinic({Key? key, this.type}) : super(key: key);
  TextEditingController DescController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  MaintenanceReq? maintenancereq;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
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
                              padding: const EdgeInsets.only(bottom: 150),
                              child:
                                  Icon(Icons.star, color: Colors.grey.shade400),
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
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0Xff054F86),
                                        Color(0Xff61C089),
                                      ],
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: TextUtils(
                                    text: AppLocalizations.of(context)!
                                        .description,
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
                                return AppLocalizations.of(context)!
                                    .description_validate;
                              }
                              return null;
                            },
                            hinttext: ''),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(colors: [
                            Color(0Xff054F86),
                            Color(0Xff61C089),
                          ], begin: Alignment.topLeft, end: Alignment.topRight),
                        ),
                        child: AuthButton(
                          text: AppLocalizations.of(context)!.confirm,
                          onPressed: () {
                            HomeCubit.get(context).valueDropDowncity = null;
                            HomeCubit.get(context).getCities();
                            if (formkey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ConfirmOrderClean(
                                    type: type,
                                    description: DescController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          color: Colors.transparent,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            FotterWidget(
              model: HomeCubit.get(context).contactInfoModel!.data,
            )
          ],
        ),
      ),
    );
  }
}
