import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/logic/auth/cubit/auth_cubit.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/view/screens/auth/login_screen.dart';
import 'package:clinic/view/screens/cart/cart_screen.dart';
import 'package:clinic/view/screens/category_child/category_child.dart';
import 'package:clinic/view/screens/clear_clinic/clear_clinic_screen.dart';
import 'package:clinic/view/screens/last_order/last_order.dart';
import 'package:clinic/view/screens/maintenance/maintenance.dart';
import 'package:clinic/view/screens/medical_supplies/category_screen.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..meInfo()
        ..getCategories()
        ..getcart()
        ..getContactinfo(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // HomeCubit.get(context).meInfo();
          return DrawerHome();
        },
      ),
    );
  }
}

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
          width: 200,
          child: Drawer(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),

            // backgroundColor: Colors.blue.shade900,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0Xff054F86),
                        Color(0Xff61C089),
                      ]),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  // height: MediaQuery.of(context).size.height * 0.25,
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    // decoration: BoxDecoration(color: Colors.blue.shade900),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextUtils(
                            text:
                                '${HomeCubit.get(context).model?.data!.firstName ?? ''}${HomeCubit.get(context).model?.data!.lastName ?? ''}',
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                  ),
                ),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  childrenPadding: EdgeInsets.zero,
                  title: Center(
                    child: TextUtils(
                      text: '${AppLocalizations.of(context)!.home}',
                      color: Colors.blue.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CategoryScreen()));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.medical_Supplies}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Maintenance()));
                      },
                      child: TextUtils(
                        text: '${AppLocalizations.of(context)!.maintenance}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 3);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ClearScreen()));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.clean_your_clinic}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  title: Center(
                    child: TextUtils(
                      text: '${AppLocalizations.of(context)!.otherservice}',
                      color: Colors.blue.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  children: [
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 5);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'cladding',
                                )));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.clinic_decoration}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 9);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'buy_clinic',
                                )));
                      },
                      child: TextUtils(
                        text: 'عيادات للبيع والايجار',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 4);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'ad',
                                )));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.publish_your_clinic}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 6);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'conditioning',
                                )));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.clinic_electricity}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 7);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'work_opportunities',
                                )));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.work_opportunities}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: TextUtils(
                        text: 'مستجدات طبية و دوائية',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getlastorder();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LastOrderScreen()));
                      },
                      child: TextUtils(
                          text: '${AppLocalizations.of(context)!.last_order}',
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getcart();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => CartScreen()));
                      },
                      child: TextUtils(
                          text: '${AppLocalizations.of(context)!.cart}',
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {},
                      child: TextUtils(
                          text: 'من نحن',
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        // CacheHelper.removeData(key: 'token').then((value) {
                        //   // HomeCubit.get(context).signout();
                        //   Navigator.of(context).pushAndRemoveUntil(
                        //       PageRouteBuilder(
                        //         transitionDuration: Duration(seconds: 1),
                        //         transitionsBuilder: (context, animation,
                        //             secondaryAnimation, child) {
                        //           animation = CurvedAnimation(
                        //               parent: animation,
                        //               curve: Curves.linearToEaseOut);
                        //           return ScaleTransition(
                        //             scale: animation,
                        //             alignment: Alignment.center,
                        //             child: child,
                        //           );
                        //         },
                        //         pageBuilder:
                        //             (context, animation, secondaryAnimation) {
                        //           return LoginScreen();
                        //         },
                        //       ),
                        //       (route) => false);
                        // });
                      },
                      child: TextUtils(
                          text: 'تسجيل الخروج',
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          )),
    );
    ;
  }
}

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
          width: 200,
          child: Drawer(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
            // backgroundColor: Colors.blue.shade900,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.25,
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        // color: Colors.blue.shade900,
                        gradient: LinearGradient(colors: [
                          Color(0Xff054F86),
                          Color(0Xff61C089),
                        ]),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextUtils(
                            text:
                                '${HomeCubit.get(context).model?.data!.firstName} ${HomeCubit.get(context).model?.data!.lastName} ',
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                  ),
                ),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  childrenPadding: EdgeInsets.zero,
                  title: Center(
                    child: TextUtils(
                      text: '${AppLocalizations.of(context)!.home}',
                      color: Colors.blue.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => CategoryScreen()));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.medical_Supplies}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => Maintenance()));
                      },
                      child: TextUtils(
                        text: '${AppLocalizations.of(context)!.maintenance}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 3);
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => ClearScreen()));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.clean_your_clinic}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  title: Center(
                    child: TextUtils(
                      text: '${AppLocalizations.of(context)!.otherservice}',
                      color: Colors.blue.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  children: [
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 5);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'cladding',
                                )));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.clinic_decoration}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 9);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'buy_clinic',
                                )));
                      },
                      child: TextUtils(
                        text: 'عيادات للبيع والايجار',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 4);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'ad',
                                )));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.publish_your_clinic}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 6);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'conditioning',
                                )));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.clinic_electricity}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).servicedetails(id: 7);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'work_opportunities',
                                )));
                      },
                      child: TextUtils(
                        text:
                            '${AppLocalizations.of(context)!.work_opportunities}',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: TextUtils(
                        text: 'مستجدات طبية و دوائية',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getlastorder();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LastOrderScreen()));
                      },
                      child: TextUtils(
                          text: '${AppLocalizations.of(context)!.last_order}',
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getcart();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => CartScreen()));
                      },
                      child: TextUtils(
                          text: '${AppLocalizations.of(context)!.cart}',
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {},
                      child: TextUtils(
                          text: 'من نحن',
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        CacheHelper.removeData(key: 'token').then((value) {
                          Navigator.of(context).pushAndRemoveUntil(
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
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return LoginScreen();
                                },
                              ),
                              (route) => false);
                        });
                      },
                      child: TextUtils(
                          text: 'تسجيل الخروج',
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          )),
    );
  }
}
