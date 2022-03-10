import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/elevated_button_gradient.dart';
import 'package:clinic/view/widgets/icon_item_search_or_noti.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        print('notifications');
                      },
                      child: IconItemWidget(iconData: Icons.notifications)),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            print('search');
                          },
                          child: IconItemWidget(iconData: Icons.search)),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FrameWithPriceAndName(),
                  SizedBox(
                    height: 35,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Center(
                        child: Material(
                          elevation: 15,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            height: 130,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: TextUtils(
                                text: 'Description....',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.blue.shade900,
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: TextUtils(
                            text: 'الوصف',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonGradientWidget(
                      color: Colors.transparent,
                      text: 'اضافة الى السلة',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}

class FrameWithPriceAndName extends StatelessWidget {
  const FrameWithPriceAndName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 230,
                height: 240,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.green,
                    Colors.blue.shade900,
                  ], begin: Alignment.topLeft, end: Alignment.topRight),
                ),
                child: Container(
                  width: 225,
                  height: 235,
                  color: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/demo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 225,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.green,
                      Colors.blue.shade900,
                    ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: TextUtils(
                    text: 'Name',
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: 160,
            height: 35,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.blue.shade900,
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: TextUtils(
                text: 'Price',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
