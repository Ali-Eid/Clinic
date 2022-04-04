import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/cart/cart_screen.dart';
import 'package:clinic/view/screens/category_child/category_child.dart';
import 'package:clinic/view/screens/clear_clinic/clear_clinic_screen.dart';
import 'package:clinic/view/screens/maintenance/maintenance.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return DrawerHome();
      },
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
                                '${HomeCubit.get(context).model!.data!.firstName}${HomeCubit.get(context).model!.data!.lastName} ',
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
                      text: '${getLang(context, "home")}',
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
                            builder: (_) => CategoryChildScreen()));
                      },
                      child: TextUtils(
                        text: '${getLang(context, 'Medical_Supplies')}',
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
                        text: '${getLang(context, 'maintenance')}',
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
                        text: '${getLang(context, "clean_your_clinic")}',
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
                      text: '${getLang(context, "otherservice")}',
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
                        text: 'اكساء و ديكورات',
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
                        text: 'اعلن عن عيادتك',
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
                        text: 'كهرباء- تكييف وتبريد',
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
                        text: 'فرص عمل',
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
                      onPressed: () {},
                      child: TextUtils(
                          text: 'طلباتك السابقة',
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
                          text: 'السلة',
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
                      onPressed: () {},
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
                                '${HomeCubit.get(context).model!.data!.firstName} ${HomeCubit.get(context).model!.data!.lastName} ',
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
                      text: '${getLang(context, "home")}',
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
                            builder: (_) => CategoryChildScreen()));
                      },
                      child: TextUtils(
                        text: '${getLang(context, 'Medical_Supplies')}',
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
                        text: '${getLang(context, 'maintenance')}',
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
                        text: '${getLang(context, "clean_your_clinic")}',
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
                      text: '${getLang(context, "otherservice")}',
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
                        text: 'اكساء و ديكورات',
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
                        text: 'اعلن عن عيادتك',
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
                        text: 'كهرباء- تكييف وتبريد',
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
                        text: 'فرص عمل',
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
                      onPressed: () {},
                      child: TextUtils(
                          text: 'طلباتك السابقة',
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
                          text: 'السلة',
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
                      onPressed: () {},
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
