import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/clear_clinic/order_clinic_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/item/item.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/elevated_button_gradient.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/frame_desc.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

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
              title: AppLocalizations.of(context)!.otherservice,
              desc: '${state.error}',
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
            body: BuildCondition(
              fallback: (context) => Center(
                  child: Shimmer.fromColors(
                      child: const ShimmerLoad(),
                      baseColor: const Color(0Xff054F86),
                      highlightColor: const Color(0Xff61C089))),
              condition: HomeCubit.get(context).servicemodel != null,
              builder: (context) => BuildCondition(
                fallback: (context) => Center(
                    child: Shimmer.fromColors(
                        child: const ShimmerLoad(),
                        baseColor: const Color(0Xff054F86),
                        highlightColor: const Color(0Xff61C089))),
                // Center(
                //     child: EasyLoader(
                //   image: const AssetImage(
                //     'assets/images/logo.png',
                //   ),
                //   backgroundColor: Colors.grey.shade300,
                //   // iconSize: 20,
                //   iconColor: const Color(0Xff054F86),
                // )),
                condition: state is! LoadingGetServiceState,
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
                            const SizedBox(
                              height: 30,
                            ),
                            FrameDesc(
                                model: HomeCubit.get(context).servicemodel!,
                                onpressed: () => Navigator.of(context).push(
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(seconds: 1),
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
            ),
          );
        },
      ),
    );
  }
}
