import 'package:clinic/applocal.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/category_child/category_child.dart';
import 'package:clinic/view/screens/maintenance/maintenance.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/category_and_title.dart';
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
          child: Scaffold(
            drawer: Drawer(),
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CategoryandTitle(
                                  ontap: () {},
                                  text: 'تعقيم العيادة',
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
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CategoryandTitle(
                                  text: 'اعلن عن عيادتك',
                                  imgurl: 'assets/images/Asset 20.png',
                                  ontap: () {},
                                ),
                                // SizedBox(
                                //   width: 30,
                                // ),
                                CategoryandTitle(
                                  text: 'عيادات للبيع والايجار',
                                  imgurl: 'assets/images/Asset 19.png',
                                  ontap: () {},
                                ),
                                // SizedBox(
                                //   width: 30,
                                // ),
                                CategoryandTitle(
                                  text: 'اكساء و ديكورات',
                                  imgurl: 'assets/images/Asset 17.png',
                                  ontap: () {},
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
                                ontap: () {},
                              ),
                              // SizedBox(
                              //   width: 30,
                              // ),
                              CategoryandTitle(
                                text: 'كهرباء- تكييف وتبريد',
                                imgurl: 'assets/images/Asset 14.png',
                                ontap: () {},
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
                  FotterWidget()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
