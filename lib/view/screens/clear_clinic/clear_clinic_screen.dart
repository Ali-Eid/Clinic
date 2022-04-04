import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/clear_clinic/order_clinic_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/item/item.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/elevated_button_gradient.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/frame_desc.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearScreen extends StatelessWidget {
  String? type;
  ClearScreen({Key? key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is ErrorGetServiceState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Our Services',
              desc: '${state.error}',
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
            body: BuildCondition(
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: Colors.green.shade400,
                ),
              ),
              condition: state is SuccessGetServiceState,
              builder: (context) => Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          NotificationSearchTitle(
                            text:
                                '${HomeCubit.get(context).servicemodel!.data!.name}',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FrameDesc(
                              model: HomeCubit.get(context).servicemodel!,
                              onpressed: () => Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 1),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        animation = CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.linearToEaseOut);
                                        return ScaleTransition(
                                          scale: animation,
                                          alignment: Alignment.center,
                                          child: child,
                                        );
                                      },
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return OrderClinic(
                                          type: type,
                                        );
                                      },
                                    ),
                                  )),
                        ],
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 50,
                  // ),
                  FotterWidget(
                    model: HomeCubit.get(context).contactInfoModel!.data,
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
