import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/category_child/category_child.dart';
import 'package:clinic/view/screens/clear_clinic/clear_clinic_screen.dart';
import 'package:clinic/view/screens/maintenance/maintenance.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/category_and_title.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:clinic/view/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var home = getLang(context, 'home');
    var other = getLang(context, 'otherservice');
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: BuildCondition(
            fallback: (context) => Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.green.shade400,
                ),
              ),
            ),
            condition: HomeCubit.get(context).model != null &&
                HomeCubit.get(context).contactInfoModel != null,
            builder: (context) => Scaffold(
              drawer: DrawerHome(),
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
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            NotificationSearchTitle(
                              text: '${getLang(context, "home")}',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CategoryandTitle(
                                    ontap: () {
                                      HomeCubit.get(context)
                                          .servicedetails(id: 3);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => ClearScreen()));
                                    },
                                    text:
                                        '${getLang(context, "clean_your_clinic")}',
                                    imgurl: 'assets/images/Asset 27.png',
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),
                                  CategoryandTitle(
                                    ontap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => Maintenance()));
                                    },
                                    text: '${getLang(context, 'maintenance')}',
                                    imgurl: 'assets/images/Asset 22.png',
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),
                                  CategoryandTitle(
                                    ontap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => CategoryChildScreen(),
                                        ),
                                      );
                                    },
                                    // text: 'Medical Supplies',
                                    text:
                                        '${getLang(context, 'Medical_Supplies')}',
                                    imgurl: 'assets/images/Asset 21.png',
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment:
                                  AppLocale.of(context).locale!.languageCode ==
                                          "ar"
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                              child: TitleWidget(
                                  text: '${getLang(context, "otherservice")}'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CategoryandTitle(
                                    text: 'اعلن عن عيادتك',
                                    imgurl: 'assets/images/Asset 20.png',
                                    ontap: () {
                                      HomeCubit.get(context)
                                          .servicedetails(id: 4);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (_) => ClearScreen(
                                                    type: 'ad',
                                                  )));
                                    },
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),
                                  CategoryandTitle(
                                    text: 'عيادات للبيع والايجار',
                                    imgurl: 'assets/images/Asset 19.png',
                                    ontap: () {
                                      HomeCubit.get(context)
                                          .servicedetails(id: 9);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (_) => ClearScreen(
                                                    type: 'buy_clinic',
                                                  )));
                                    },
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),
                                  CategoryandTitle(
                                    text: 'اكساء و ديكورات',
                                    imgurl: 'assets/images/Asset 17.png',
                                    ontap: () {
                                      HomeCubit.get(context)
                                          .servicedetails(id: 5);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (_) => ClearScreen(
                                                    type: 'cladding',
                                                  )));
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CategoryandTitle(
                                  text: 'مستجدات طبية و دوائية',
                                  imgurl: 'assets/images/Asset 16.png',
                                  ontap: () {},
                                ),
                                // SizedBox(
                                //   width: 30,
                                // ),
                                CategoryandTitle(
                                  text: 'فرص عمل',
                                  imgurl: 'assets/images/Asset 15.png',
                                  ontap: () {
                                    HomeCubit.get(context)
                                        .servicedetails(id: 7);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => ClearScreen(
                                                  type: 'work_opportunities',
                                                )));
                                  },
                                ),
                                // SizedBox(
                                //   width: 30,
                                // ),
                                CategoryandTitle(
                                  text: 'كهرباء- تكييف وتبريد',
                                  imgurl: 'assets/images/Asset 14.png',
                                  ontap: () {
                                    HomeCubit.get(context)
                                        .servicedetails(id: 6);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => ClearScreen(
                                                  type: 'conditioning',
                                                )));
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    FotterWidget(
                      model: HomeCubit.get(context).contactInfoModel!.data,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
