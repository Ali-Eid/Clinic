import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/product_datails_model.dart';
import 'package:clinic/model/product_model.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/elevated_button_gradient.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/icon_item_search_or_noti.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/show_toast.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_loader/easy_loader.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is SuccessShowCartState) {
            // showToast(
            //     message: 'add to cart successfully', state: ToastState.success);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds: 500),
              content: TextUtils(
                  text: 'add to cart successfully',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              backgroundColor: Color(0Xff054F86),
            ));
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
                  child: EasyLoader(
                image: AssetImage('assets/images/logo.png'),
                backgroundColor: Colors.white,
                // iconSize: 30,
                iconColor: Color(0Xff054F86),
              )),
              condition: state is! LoadingProductDetailsState,
              builder: (context) => BuildCondition(
                fallback: (context) => Center(
                  child: TextUtils(
                      text: 'No Product Data',
                      color: Colors.green.shade400,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                condition: HomeCubit.get(context).itemdetails != null,
                builder: (context) => Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NotificationSearchTitle(
                              text:
                                  '${HomeCubit.get(context).itemdetails!.data!.name}',
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            FrameWithPriceAndName(
                              model: HomeCubit.get(context).itemdetails,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ButtonGradientWidget(
                                color: Colors.transparent,
                                text: 'Add to Cart',
                                onPressed: () {
                                  HomeCubit.get(context).addtocart(
                                      id: HomeCubit.get(context)
                                          .itemdetails!
                                          .data!
                                          .id);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FotterWidget(
                      salla1: true,
                      model: HomeCubit.get(context).contactInfoModel!.data,
                    )
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

class FrameWithPriceAndName extends StatelessWidget {
  ProductDetailsModel? model;
  FrameWithPriceAndName({
    Key? key,
    required this.model,
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
                    Color(0Xff054F86),
                    Color(0Xff61C089),
                  ], begin: Alignment.topLeft, end: Alignment.topRight),
                ),
                child: Container(
                  width: 225,
                  height: 235,
                  color: Colors.white,
                  child: CarouselSlider(
                    items: [
                      'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                      'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                    ]
                        .map(
                          (e) => CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: double.infinity,
                            imageUrl: "${e}",
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                  color: Colors.green.shade400),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )
                        .toList(),
                    // carouselController: carouselController,
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      pauseAutoPlayInFiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.linearToEaseOut,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 225,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0Xff054F86),
                      Color(0Xff61C089),
                    ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: TextUtils(
                    text: '${model!.data!.name}',
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
                    Color(0Xff054F86),
                    Color(0Xff61C089),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: TextUtils(
                text: '${model!.data!.price}',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 35,
          ),
          Stack(
            alignment: AlignmentDirectional.topEnd,
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextUtils(
                        text: '${model!.data!.details}',
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
                        Color(0Xff054F86),
                        Color(0Xff61C089),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: TextUtils(
                    text: 'Description',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
