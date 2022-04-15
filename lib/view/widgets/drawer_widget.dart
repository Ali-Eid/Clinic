import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/logic/auth/cubit/auth_cubit.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/view/screens/auth/login_screen.dart';
import 'package:clinic/view/screens/cart/cart_screen.dart';
import 'package:clinic/view/screens/category_child/category_child.dart';
import 'package:clinic/view/screens/clear_clinic/clear_clinic_screen.dart';
import 'package:clinic/view/screens/last_order/last_order.dart';
import 'package:clinic/view/screens/latest_news/latest_news_screen.dart';
import 'package:clinic/view/screens/maintenance/maintenance.dart';
import 'package:clinic/view/screens/medical_supplies/category_screen.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerHome extends StatelessWidget {
  String? text;
  DrawerHome({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
          width: 200,
          child: Drawer(
            shape: RoundedRectangleBorder(
                borderRadius: AppLocalizations.of(context)!.language == 'Arabic'
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )
                    : const BorderRadius.only(
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
                      gradient: const LinearGradient(colors: [
                        Color(0Xff054F86),
                        Color(0Xff61C089),
                      ]),
                      borderRadius:
                          AppLocalizations.of(context)!.language == 'Arabic'
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))
                              : const BorderRadius.only(
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
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextUtils(
                            text: text!,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                  ),
                ),
                ExpansionTile(
                  tilePadding: const EdgeInsets.all(10),
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  childrenPadding: EdgeInsets.zero,
                  title: Center(
                    child: TextUtils(
                      text: AppLocalizations.of(context)!.home,
                      color: Colors.blue.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  children: [
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context)
                            .servicedetails(slug: 'medical-supplies');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CategoryScreen()));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.medical_Supplies,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Maintenance()));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.maintenance,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'clean-your-clinic');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(type: 'clean')));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.clean_your_clinic,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  title: Center(
                    child: TextUtils(
                      text: AppLocalizations.of(context)!.otherservice,
                      color: Colors.blue.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  children: [
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'clinic-decoration');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'cladding',
                                )));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.clinic_decoration,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // HomeCubit.get(context).servicedetails(id: 9);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => ClearScreen(
                        //           type: 'buy_clinic',
                        //         )));
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
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'publish-your-clinic');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'ad',
                                )));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.publish_your_clinic,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'clinic-electricity');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'conditioning',
                                )));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.clinic_electricity,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'work-opportunities');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'work_opportunities',
                                )));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.work_opportunities,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getlatestnews();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LatestNewsScreen()));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.latest_news,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getlastorder();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const LastOrderScreen()));
                      },
                      child: TextUtils(
                          text: AppLocalizations.of(context)!.last_order,
                          color: Colors.blue.shade900,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getcart();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const CartScreen()));
                      },
                      child: TextUtils(
                          text: AppLocalizations.of(context)!.cart,
                          color: Colors.blue.shade900,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {},
                      child: TextUtils(
                          text: 'من نحن',
                          color: Colors.blue.shade900,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 60,
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // borderOnForeground: false,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  elevation: 10,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0Xff054F86),
                      Color(0Xff61C089),
                    ])),
                    child: TextButton(
                        onPressed: () {
                          CacheHelper.removeData(key: 'token').then((value) {
                            HomeCubit.get(context).signout();
                            Navigator.of(context).pushAndRemoveUntil(
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
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return LoginScreen();
                                  },
                                ),
                                (route) => false);
                          });
                        },
                        child: TextUtils(
                            text: AppLocalizations.of(context)!.sign_out,
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )),
    );
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
      child: SizedBox(
          width: 200,
          child: Drawer(
            shape: RoundedRectangleBorder(
                borderRadius: AppLocalizations.of(context)!.language == 'Arabic'
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )
                    : const BorderRadius.only(
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
                        gradient: const LinearGradient(colors: [
                          Color(0Xff054F86),
                          Color(0Xff61C089),
                        ]),
                        borderRadius:
                            AppLocalizations.of(context)!.language == 'Arabic'
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))
                                : const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                          ),
                        ),
                        const SizedBox(
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
                      text: AppLocalizations.of(context)!.home,
                      color: Colors.blue.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  children: [
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context)
                            .servicedetails(slug: 'medical-supplies');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => CategoryScreen()));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.medical_Supplies,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => Maintenance()));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.maintenance,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'clean-your-clinic');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(type: 'clean')));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.clean_your_clinic,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  title: Center(
                    child: TextUtils(
                      text: AppLocalizations.of(context)!.otherservice,
                      color: Colors.blue.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  children: [
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'clinic-decoration');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'cladding',
                                )));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.clinic_decoration,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // HomeCubit.get(context).servicedetails(id: 9);
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (_) => ClearScreen(
                        //           type: 'buy_clinic',
                        //         )));
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
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'publish-your-clinic');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'ad',
                                )));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.publish_your_clinic,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'clinic-electricity');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'conditioning',
                                )));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.clinic_electricity,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getCities();
                        HomeCubit.get(context)
                            .servicedetails(slug: 'work-opportunities');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ClearScreen(
                                  type: 'work_opportunities',
                                )));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.work_opportunities,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getlatestnews();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LatestNewsScreen()));
                      },
                      child: TextUtils(
                        text: AppLocalizations.of(context)!.latest_news,
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getlastorder();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const LastOrderScreen()));
                      },
                      child: TextUtils(
                          text: AppLocalizations.of(context)!.last_order,
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        HomeCubit.get(context).getcart();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const CartScreen()));
                      },
                      child: TextUtils(
                          text: AppLocalizations.of(context)!.cart,
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 60,
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // borderOnForeground: false,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  elevation: 10,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0Xff054F86),
                      Color(0Xff61C089),
                    ])),
                    child: TextButton(
                        onPressed: () {
                          CacheHelper.removeData(key: 'token').then((value) {
                            HomeCubit.get(context).signout();
                            Navigator.of(context).pushAndRemoveUntil(
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
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return LoginScreen();
                                  },
                                ),
                                (route) => false);
                          });
                        },
                        child: TextUtils(
                            text: AppLocalizations.of(context)!.sign_out,
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
