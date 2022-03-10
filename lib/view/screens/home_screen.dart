import 'package:clinic/view/screens/category_child/category_child.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/category_and_title.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:clinic/view/widgets/title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        // appBar: AppBar(
        //   leading: Builder(builder: (context) {
        //     return IconButton(
        //       onPressed: () => Scaffold.of(context).openDrawer(),
        //       icon: Icon(
        //         Icons.menu,
        //         color: Colors.black,
        //       ),
        //     );
        //   }),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu));
                  })),
              // SizedBox(
              //   height: 50,
              // ),
              NotificationSearchTitle(text: 'الخدمات الأساسية'),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryandTitle(
                      ontap: () {
                        print('تعقيم العيادة');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CategoryChildScreen()));
                      },
                      text: 'تعقيم العيادة',
                      imgurl: 'assets/images/demo.jpg',
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    CategoryandTitle(
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CategoryChildScreen()));
                      },
                      text: 'صيانة اجهزتي',
                      imgurl: 'assets/images/demo.jpg',
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    CategoryandTitle(
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CategoryChildScreen()));
                      },
                      text: 'مستهلكات طبية',
                      imgurl: 'assets/images/demo.jpg',
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TitleWidget(text: 'الخدمات الاخرى'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryandTitle(
                    text: 'اكساء وديكورات',
                    imgurl: 'assets/images/demo.jpg',
                    ontap: () {},
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CategoryandTitle(
                    text: 'اكساء وديكورات',
                    imgurl: 'assets/images/demo.jpg',
                    ontap: () {},
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CategoryandTitle(
                    text: 'اكساء وديكورات',
                    imgurl: 'assets/images/demo.jpg',
                    ontap: () {},
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryandTitle(
                    text: 'اكساء وديكورات',
                    imgurl: 'assets/images/demo.jpg',
                    ontap: () {},
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CategoryandTitle(
                    text: 'اكساء وديكورات',
                    imgurl: 'assets/images/demo.jpg',
                    ontap: () {},
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CategoryandTitle(
                    text: 'اكساء وديكورات',
                    imgurl: 'assets/images/demo.jpg',
                    ontap: () {},
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(colors: [
                          Colors.green,
                          Colors.blue.shade900,
                        ], begin: Alignment.topLeft, end: Alignment.topRight),
                      ),
                      // width: 50,
                      child: AuthButton(
                        color: Colors.transparent,
                        text: 'who are we',
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
