import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/product_model.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/elevated_button_gradient.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/icon_item_search_or_noti.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class ItemProduct extends StatelessWidget {
  int? index;
  ItemProduct({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is SuccessAddToCartState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(milliseconds: 300),
              content: TextUtils(
                  text: AppLocalizations.of(context)!.add_to_cart_successfully,
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              backgroundColor: const Color(0Xff054F86),
            ));
          }
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
              // const Center(
              //     child: EasyLoader(
              //   image: AssetImage('assets/images/logo.png'),
              //   backgroundColor: Colors.white,
              //   // iconSize: 30,
              //   iconColor: Color(0Xff054F86),
              // )),
              condition: state is! LoadingCategoriesState,
              builder: (context) => BuildCondition(
                fallback: (context) => Center(
                  child: TextUtils(
                      text: AppLocalizations.of(context)!.no_product,
                      color: Colors.green.shade400,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                condition:
                    HomeCubit.get(context).productModel!.data!.isNotEmpty,
                // state is SuccessProductDetailsState,
                builder: (context) => Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NotificationSearchTitle(
                              text:
                                  '${HomeCubit.get(context).productModel!.data![index!].name}',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            FrameWithPriceAndName(
                              model: HomeCubit.get(context)
                                  .productModel!
                                  .data![index!],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ButtonGradientWidget(
                                color: Colors.transparent,
                                text: AppLocalizations.of(context)!.add_to_cart,
                                onPressed: () {
                                  HomeCubit.get(context).addtocart(
                                      id: HomeCubit.get(context)
                                          .productModel!
                                          .data![index!]
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
  DataProduct? model;
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
                decoration: const BoxDecoration(
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
                            imageUrl: e,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                  color: Colors.green.shade400),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
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
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
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
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0Xff054F86),
                      Color(0Xff61C089),
                    ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: TextUtils(
                    text: model!.name!,
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
            decoration: const BoxDecoration(
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
                text: '${model!.price}',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Center(
                child: Material(
                  elevation: 15,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 130,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextUtils(
                        text: '${model!.details}',
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
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0Xff054F86),
                        Color(0Xff61C089),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: TextUtils(
                    text: AppLocalizations.of(context)!.description,
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
