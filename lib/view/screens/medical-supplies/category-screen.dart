import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/medical_supplies.dart';
import 'package:clinic/view/screens/category_child/product_category/products_category.dart';
import 'package:clinic/view/screens/medical-supplies/sub-category.dart';
import 'package:clinic/view/widgets/category_and_title.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/grid_custom.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

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
                  text: AppLocalizations.of(context)!.medical_Supplies,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:
                          HomeCubit.get(context).medicalModel!.data!.length,
                      // padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                              itemCount: HomeCubit.get(context)
                                  .medicalModel!
                                  .data!
                                  .length,
                              childAspectRatio: 1.2,
                              crossAxisCount: 2,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 1),
                      itemBuilder: (ctxt, index) {
                        return CategoryChild2(
                          model:
                              HomeCubit.get(context).medicalModel!.data![index],
                          index: index,
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryChild2 extends StatelessWidget {
  MedicalSuppliesData? model;
  int? index;
  CategoryChild2({Key? key, this.model, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (model!.hasChildren!) {
              HomeCubit.get(context).getsubCategory(model!.id!);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      SubCategoryPage(id: model!.id, name: '${model!.name}')));
            } else {
              HomeCubit.get(context).getproductDetails(id: model!.id);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      ProductCategory(id: model!.id!, name: model!.name!)));

              // return CategoryItemsScreen(
              //     id: model!.id!, name: model!.name!);
            }
            // if (model!.hasChildren!) {
            //   HomeCubit.get(context).getsubCategory(model!.id!);
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (_) =>
            //           SubCategoryPage(id: model!.id, name: '${model!.name}')));
            //   // HomeCubit.get(context).subModel = null;
            // }
          },
          child: Container(
              height: height / 8,
              width: width / 4,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0Xff054F86),
                    Color(0Xff61C089),
                  ]),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                child: CachedNetworkImage(
                  matchTextDirection: true,
                  fit: BoxFit.fill,
                  imageUrl: '$urlimg${model!.icon}',
                  // imageUrl:
                  //     'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                ),
              )
              // Image(
              //   image: NetworkImage('$urlimg${model!.icon}'),
              // ),
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {},
              child: TextUtils(
                text: '${model!.name}',
                color: Colors.blue.shade900,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
        )
      ],
    );
  }
}

    // CategoryandTitle(
    //     height: height / 8,
    //     width: width / 4,
    //     text: '${model!.name}',
    //     imgurl: '$urlimg${model!.icon}',
    //     ontap: () {
    //       // if (model!.hasChildren!) {
    //       //   HomeCubit.get(context).getsubCategory(model!.id!);
    //       // } else {
    //       //   HomeCubit.get(context).getproductDetails(id: model!.id);
    //       // }
    //       Navigator.push(
    //         context,
    //         PageRouteBuilder(
    //           transitionDuration: const Duration(seconds: 1),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //             animation = CurvedAnimation(
    //                 parent: animation, curve: Curves.linearToEaseOut);
    //             return ScaleTransition(
    //               scale: animation,
    //               alignment: Alignment.center,
    //               child: child,
    //             );
    //           },
    //           pageBuilder: (context, animation, secondaryAnimation) {
    //             return const Scaffold(body: Center(child: Text('null')));
    //             // if (model!.hasChildren!) {
    //             //   return SubCategoryScreen(name: model!.name!);
    //             // } else {
    //             //   return ProductCategory(id: model!.id!, name: model!.name!);
    //             //   // return CategoryItemsScreen(
    //             //   //     id: model!.id!, name: model!.name!);
    //             // }
    //           },
    //         ),
    //       );
    //     });