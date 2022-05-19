import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/model/service_model.dart';
import 'package:clinic/view/widgets/elevated_button_gradient.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

class FrameDesc extends StatelessWidget {
  CarouselController carouselController = CarouselController();
  ServiceModel? model;
  String? imgurl;
  String? description;
  VoidCallback? onpressed;
  FrameDesc({
    Key? key,
    this.model,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 75,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius:
                      AppLocalizations.of(context)!.language == "Arabic"
                          ? const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))
                          : const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                  gradient: const LinearGradient(colors: [
                    Color(0Xff054F86),
                    Color(0Xff61C089),
                  ])),
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    carouselController.previousPage(
                        duration: const Duration(milliseconds: 300));
                  },
                  icon: const Icon(Icons.arrow_left, color: Colors.white)),
            ),
            Container(
              width: 300,
              height: MediaQuery.of(context).size.height * 0.35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.blue.shade900,
                ], begin: Alignment.topLeft, end: Alignment.topRight),
              ),
              child: Container(
                width: 295,
                height: MediaQuery.of(context).size.height * 0.345,
                color: Colors.white,
                child: CarouselSlider(
                  items: model!.data!.images!
                      // [
                      //   'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                      //   'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                      // ]
                      .map(
                        (e) => CachedNetworkImage(
                          fit: BoxFit.fill,
                          width: double.infinity,
                          imageUrl: '$urlimg${e.path!}',
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                                color: Colors.green.shade400),
                          ),
                          errorWidget: (context, url, error) => Lottie.asset(
                            'assets/images/not_found.json',
                          ),
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
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
                padding: EdgeInsets.zero,
                height: 75,
                width: 25,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    carouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0Xff61C089),
                      Color(0Xff054F86),
                    ],
                  ),
                  borderRadius:
                      AppLocalizations.of(context)!.language == "Arabic"
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15))
                          : const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                )),
          ],
        ),
        const SizedBox(
          height: 30,
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
                  // height: 130,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextUtils(
                      text: model?.data!.description ?? 'No Description',
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonGradientWidget(
          color: Colors.transparent,
          text: AppLocalizations.of(context)!.confirm,
          onPressed: onpressed,
        ),
      ],
    );
  }
}
