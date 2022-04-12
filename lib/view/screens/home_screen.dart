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
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'medical_supplies/category_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var home = getLang(context, 'home');
    // var other = getLang(context, 'otherservice');
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: BuildCondition(
            fallback: (context) => Scaffold(
              body: Center(
                  child: EasyLoader(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                backgroundColor: Colors.grey.shade300,
                // iconSize: 20,
                iconColor: Color(0Xff054F86),
              )),
            ),
            condition: HomeCubit.get(context).contactInfoModel != null,
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
                              text: '${AppLocalizations.of(context)!.home}',
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
                                        '${AppLocalizations.of(context)!.clean_your_clinic}',
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
                                    text:
                                        '${AppLocalizations.of(context)!.maintenance}',
                                    imgurl: 'assets/images/Asset 22.png',
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),
                                  CategoryandTitle(
                                    ontap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => CategoryScreen(),
                                        ),
                                      );
                                    },
                                    // text: 'Medical Supplies',
                                    text:
                                        '${AppLocalizations.of(context)!.medical_Supplies}',
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
                                  AppLocalizations.of(context)!.language ==
                                          "Arabic"
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                              child: TitleWidget(
                                  text:
                                      '${AppLocalizations.of(context)!.otherservice}'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.40,
                              child: GridView.count(
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 2,
                                crossAxisCount: 3,
                                children: <Widget>[
                                  CategoryandTitle(
                                    text:
                                        '${AppLocalizations.of(context)!.clinic_decoration}',
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
                                    text:
                                        '${AppLocalizations.of(context)!.publish_your_clinic}',
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
                                  ),
                                  CategoryandTitle(
                                    text: 'مستجدات طبية و دوائية',
                                    imgurl: 'assets/images/Asset 16.png',
                                    ontap: () {},
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),
                                  CategoryandTitle(
                                    text:
                                        '${AppLocalizations.of(context)!.work_opportunities}',
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
                                    text:
                                        '${AppLocalizations.of(context)!.clinic_electricity}',
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
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),

                            // SizedBox(
                            //   height: 10,
                            // ),
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
