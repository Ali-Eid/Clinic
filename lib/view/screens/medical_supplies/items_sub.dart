import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/product_model.dart';
import 'package:clinic/view/screens/medical_supplies/item_details.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/category_item.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/grid_custom.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class ItemSubCateg extends StatelessWidget {
  // int id;
  String name;

  ItemSubCateg({Key? key, required this.name}) : super(key: key);

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
            body: BuildCondition(
              fallback: (context) => Center(
                  child: Shimmer.fromColors(
                      child: const ShimmerLoad(),
                      baseColor: const Color(0Xff054F86),
                      highlightColor: const Color(0Xff61C089))),
              condition: state is! LoadingCategoriesState,
              builder: (context) => BuildCondition(
                fallback: (context) => Center(
                    child: Shimmer.fromColors(
                        child: const ShimmerLoad(),
                        baseColor: const Color(0Xff054F86),
                        highlightColor: const Color(0Xff61C089))),
                // Center(
                //   child: TextUtils(
                //       text: AppLocalizations.of(context)!.no_product,
                //       color: Colors.green.shade400,
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold),
                // ),
                condition: HomeCubit.get(context).subModel != null,
                builder: (context) => Column(
                  children: [
                    NotificationSearchTitle(text: name),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildCondition(
                      fallback: (context) => Expanded(
                          child: Lottie.asset('assets/images/no-data.json',
                              width: 200, height: 100)),
                      condition:
                          HomeCubit.get(context).subModel!.data!.isNotEmpty,
                      builder: (context) => Expanded(
                        child: GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            itemCount: HomeCubit.get(context)
                                .productModel!
                                .data!
                                .length,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                              itemCount: HomeCubit.get(context)
                                  .productModel!
                                  .data!
                                  .length,
                              crossAxisCount: 2,
                              // childAspectRatio: 3 / 2,
                            ),
                            shrinkWrap: true,
                            itemBuilder: (ctxt, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: item_categ(
                                    model: HomeCubit.get(context)
                                        .productModel!
                                        .data![index],
                                  ),
                                )),
                      ),
                    ),
                    FotterWidget(
                      model: HomeCubit.get(context).contactInfoModel?.data,
                      salla1: true,
                      // model: HomeCubit.get(context).contactInfoModel!.data,
                    ),
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

class item_categ extends StatelessWidget {
  DataProduct? model;
  item_categ({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HomeCubit.get(context).getproductdetails(id: model!.id);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const ItemDetailsScreen()));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            width: 165,
            height: 165,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              // border: Border.all(width: 1),
              gradient: LinearGradient(colors: [
                Color(0Xff054F86),
                Color(0Xff61C089),
              ], begin: Alignment.topLeft, end: Alignment.topRight),
            ),
            child: Container(
              width: 160,
              height: 160,
              color: Colors.white,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                // imageUrl: "${model.icon}",
                imageUrl:
                    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                placeholder: (context, url) => Center(
                  child:
                      CircularProgressIndicator(color: Colors.green.shade400),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // alignment: Alignment.center,
            width: 125,
            // height: 25,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0Xff054F86),
                  Color(0Xff61C089),
                ], begin: Alignment.topLeft, end: Alignment.topRight),
                borderRadius:
                    BorderRadiusDirectional.only(topEnd: Radius.circular(30))),
            child: TextUtils(
                text: model!.name!,
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
