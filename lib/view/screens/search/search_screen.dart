import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/search/search_model.dart';
import 'package:clinic/view/screens/item/item.dart';
import 'package:clinic/view/screens/medical_supplies/item_details.dart';
import 'package:clinic/view/widgets/auth/text_form_field.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/grid_custom.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchcontroller = TextEditingController();
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NotificationSearchTitle(
                  text: AppLocalizations.of(context)!.search,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      HomeCubit.get(context).searchproduct(item: value);
                    },
                    cursorColor: Colors.black,
                    // minLines: minLines,
                    // maxLines: maxLines,
                    // keyboardType: textInputType,
                    // validator: validator,
                    // onSaved: onsaved,
                    style: const TextStyle(
                      fontFamily: 'Mikhak',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      // isDense: true,

                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      prefixIcon: Container(
                          margin: const EdgeInsetsDirectional.only(end: 10),
                          alignment: Alignment.center,
                          width: 50,
                          // height: 40,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0Xff054F86),
                                  Color(0Xff61C089),
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: const Icon(Icons.search, color: Colors.white)),
                      // suffixIcon: suffixIcon,
                      // hintText: hinttext,
                      hintStyle: TextStyle(
                        fontFamily: 'Mikhak',
                        color: Colors.grey.shade500,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      focusColor: Colors.transparent,
                      hintText: AppLocalizations.of(context)!.hint_text_search,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                state is SuccessSearchProductState
                    ? state.search!.data!.data != null
                        ? state.search!.data!.data!.isNotEmpty
                            ? Expanded(
                                child: GridView.builder(
                                    itemCount: state.search!.data!.data!.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                                            itemCount: state
                                                .search!.data!.data!.length,
                                            crossAxisCount: 2,
                                            childAspectRatio: 1),
                                    itemBuilder: (ctxt, index) {
                                      return Frame_Name_search_widget(
                                        model: state.search!.data!.data![index],
                                      );
                                    }))
                            : Expanded(
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/images/empty_search.json',
                                    width: MediaQuery.of(context).size.width *
                                        0.60,
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                  ),
                                ),
                              )
                        : Expanded(
                            child: Center(
                              child: Lottie.asset(
                                'assets/images/search.json',
                                width: MediaQuery.of(context).size.width * 0.60,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                              ),
                            ),
                          )
                    : Expanded(
                        child: Center(
                          child: Lottie.asset(
                            'assets/images/search.json',
                            width: MediaQuery.of(context).size.width * 0.60,
                            height: MediaQuery.of(context).size.height * 0.20,
                          ),
                        ),
                      ),
                FotterWidget(
                  model: HomeCubit.get(context).contactInfoModel?.data,
                  salla1: true,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class Frame_Name_search_widget extends StatelessWidget {
  DataProd? model;
  Frame_Name_search_widget({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HomeCubit.get(context).getproductdetails(id: model!.id);
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.linearToEaseOut);
                return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return const ItemDetailsScreen();
              },
            ));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 150,
            height: 150,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0Xff054F86),
                Color(0Xff61C089),
              ], begin: Alignment.topLeft, end: Alignment.topRight),
            ),
            child: Container(
              width: 145,
              height: 145,
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
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.linearToEaseOut,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 25,
            width: 140,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0Xff054F86),
                  Color(0Xff61C089),
                ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: TextUtils(
                text: '${model!.name}',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
