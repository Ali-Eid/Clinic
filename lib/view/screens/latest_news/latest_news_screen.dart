import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/latest_news_model.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class LatestNewsScreen extends StatelessWidget {
  LatestNewsScreen({Key? key}) : super(key: key);
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
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
            body: Column(
              children: [
                NotificationSearchTitle(
                  text: AppLocalizations.of(context)!.latest_news,
                ),
                const SizedBox(
                  height: 30,
                ),
                state is SuccessLatestNewsState
                    ? Expanded(
                        child: PageView.builder(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state.latestNewsModel!.data!.data!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (ctxt, index) {
                              return item_latest_news(
                                model:
                                    state.latestNewsModel!.data!.data![index],
                              );
                            }),
                      )
                    : Expanded(
                        child: Center(
                            child: Shimmer.fromColors(
                                child: const ShimmerLoad(),
                                baseColor: const Color(0Xff054F86),
                                highlightColor: const Color(0Xff61C089))),
                      ),
                FotterWidget(
                  model: HomeCubit.get(context).contactInfoModel?.data,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class item_latest_news extends StatelessWidget {
  DataNews? model;
  item_latest_news({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Shimmer.fromColors(
              child: Container(
                  width: 307,
                  height: MediaQuery.of(context).size.height * 0.30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0Xff054F86), Color(0Xff61C089)],
                    ),
                  )),
              baseColor: const Color(0Xff054F86),
              highlightColor: const Color(0Xff61C089),
            ),
            Container(
              width: 300,
              height: MediaQuery.of(context).size.height * 0.290,
              color: Colors.white,
              child: CarouselSlider(
                items: model!.images!.map((e) {
                  return CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      imageUrl: 'https://my-clinic22.herokuapp.com/${e.path}',
                      placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                                color: Colors.green.shade400),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error));
                }).toList(),
                // carouselController: carouselController,
                options: CarouselOptions(
                  pauseAutoPlayOnManualNavigate: false,
                  height: MediaQuery.of(context).size.height,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  // pauseAutoPlayInFiniteScroll: false,
                  // pauseAutoPlayOnTouch: false,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Material(
              elevation: 10,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  // height: 130,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '${model!.content}',
                    style: const TextStyle(
                      fontFamily: 'Mikhak',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ),
        ),
        // SizedBox(
        //   height: 20,
        // ),
        // ButtonGradientWidget(
        //   color: Colors.transparent,
        //   text: 'test',
        //   onPressed: () {},
        // ),
      ],
    );
  }
}
