import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/clear_clinic/order_clinic_confirm.dart';
import 'package:clinic/view/screens/item/item.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/category_item.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
                condition: state is! LoadingShowCartState,
                builder: (context) {
                  // HomeCubit.get(context).getcart();
                  return BuildCondition(
                    fallback: (context) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/images/cart-empty.json',
                              width: MediaQuery.of(context).size.width * 0.60,
                              height: MediaQuery.of(context).size.height * 0.20,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextUtils(
                                text: AppLocalizations.of(context)!.cart_empty,
                                color: const Color(0Xff054F86),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)
                          ],
                        ),
                      );
                    },
                    condition: HomeCubit.get(context).showCartModel != null,
                    builder: (context) => BuildCondition(
                      fallback: (context) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'assets/images/cart-empty.json',
                                width: MediaQuery.of(context).size.width * 0.60,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextUtils(
                                  text:
                                      AppLocalizations.of(context)!.cart_empty,
                                  color: const Color(0Xff054F86),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        );
                      },
                      condition: HomeCubit.get(context).cart2.isNotEmpty,
                      builder: (context) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          NotificationSearchTitle(
                            text: AppLocalizations.of(context)!.cart,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: GridView.builder(
                                itemCount: HomeCubit.get(context).cart2.length,
                                // HomeCubit.get(context).subModel!.data!.length,
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                                        itemCount:
                                            HomeCubit.get(context).cart2.length,
                                        //  HomeCubit.get(context)
                                        //     .showCartModel!
                                        //     .data!
                                        //     .cart!
                                        //     .length,
                                        // HomeCubit.get(context).subModel!.data!.length,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.5),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemBuilder: (ctxt, index) =>
                                    CartCategoryItemWidget(
                                        modelCart:
                                            HomeCubit.get(context).cart2[index]
                                        //  HomeCubit.get(context)
                                        //     .showCartModel!
                                        //     .data!
                                        //     .cart![index],
                                        )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.centerStart,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: const LinearGradient(colors: [
                                          Color(0Xff054F86),
                                          Color(0Xff61C089),
                                        ])),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: ButtonGradientWidget(
                                          color: Colors.transparent,
                                          text:
                                              ' ${HomeCubit.get(context).showCartModel!.data!.totalPrice} ',
                                          onPressed: () {
                                            HomeCubit.get(context)
                                                .valueDropDowncity = null;
                                            HomeCubit.get(context).getCities();
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration:
                                                      const Duration(
                                                          seconds: 1),
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    animation = CurvedAnimation(
                                                        parent: animation,
                                                        curve: Curves
                                                            .linearToEaseOut);
                                                    return ScaleTransition(
                                                      scale: animation,
                                                      alignment:
                                                          Alignment.center,
                                                      child: child,
                                                    );
                                                  },
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondaryAnimation) {
                                                    return ConfirmOrderClean(
                                                      type: 'buy_products',
                                                    );
                                                  },
                                                ));

                                            print(
                                                '${HomeCubit.get(context).showCartModel!.data!.totalPrice}');
                                          }),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        // borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(colors: [
                                          Color(0Xff054F86),
                                          Color(0Xff61C089),
                                        ])),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: TextUtils(
                                        text: AppLocalizations.of(context)!.buy,
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(colors: [
                                      Color(0Xff054F86),
                                      Color(0Xff61C089),
                                    ])),
                                child: ButtonGradientWidget(
                                    color: Colors.transparent,
                                    text:
                                        AppLocalizations.of(context)!.clear_all,
                                    onPressed: () {
                                      HomeCubit.get(context).deleteAllCart();
                                    }),
                              ),
                            ],
                          ),
                          FotterWidget(
                            salla1: true,
                            model:
                                HomeCubit.get(context).contactInfoModel!.data,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
