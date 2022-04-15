import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/last_order_model.dart';
import 'package:clinic/view/screens/item/item.dart';
import 'package:clinic/view/screens/medical_supplies/item_details.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/category_item_cart_widget.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/elevated_button_gradient.dart';
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

class LastProductOrder extends StatelessWidget {
  List<Products>? products;
  String? title;
  LastProductOrder({Key? key, this.products, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
        // TODO: implement listener
        if (state is SuccessAddToCartState) {
          // showToast(
          //     message: 'add to cart successfully', state: ToastState.success);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 500),
            content: TextUtils(
                text: 'add to cart successfully',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
            backgroundColor: const Color(0Xff054F86),
          ));
        }
      }, builder: (context, state) {
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
            condition: products! != null || products!.isNotEmpty,
            builder: (context) => Column(
              children: [
                NotificationSearchTitle(
                  text: '$title',
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                        itemCount: products!.length,
                        // HomeCubit.get(context).subModel!.data!.length,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                                itemCount: products!.length,
                                // HomeCubit.get(context).subModel!.data!.length,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.7),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (ctxt, index) => item(
                              model: products![index],
                            )),
                  ),
                ),
                FotterWidget(
                  salla1: true,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class item extends StatelessWidget {
  Products? model;
  item({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            HomeCubit.get(context).getproductdetails(id: model!.product!.id);
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
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  // border: Border.all(width: 1),
                  gradient: LinearGradient(colors: [
                    Color(0Xff054F86),
                    Color(0Xff61C089),
                  ], begin: Alignment.topLeft, end: Alignment.topRight),
                ),
                child: Container(
                  width: 195,
                  height: 195,
                  color: Colors.white,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    // imageUrl: "${model.icon}",
                    imageUrl:
                        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                          color: Colors.green.shade400),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                width: 190,
                height: 30,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0Xff054F86),
                      Color(0Xff61C089),
                    ], begin: Alignment.topLeft, end: Alignment.topRight),
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(30),
                        topStart: Radius.circular(30))),
                child: TextUtils(
                    text: model?.product?.name ?? 'name',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Container(height: 1, color: Colors.grey.shade300),
        InkWell(
          onTap: () {
            HomeCubit.get(context).addtocart(id: model!.product!.id);
          },
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 10,
            color: Colors.transparent,
            shadowColor: Colors.grey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              width: 170,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  gradient: const LinearGradient(colors: [
                    Color(0Xff054F86),
                    Color(0Xff61C089),
                  ], begin: Alignment.topLeft, end: Alignment.topRight),
                  borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(30),
                      bottomStart: Radius.circular(30))),
              child: TextUtils(
                // text: '${widget.modelCart?.cartProduct!.quantity}',
                text: AppLocalizations.of(context)!.add_to_cart,
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
