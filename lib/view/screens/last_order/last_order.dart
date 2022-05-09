import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/last_order_model.dart';
import 'package:clinic/view/screens/cart/cart_screen.dart';
import 'package:clinic/view/screens/last_order/last_product_order.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/notification_search_title.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class LastOrderScreen extends StatelessWidget {
  const LastOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return SafeArea(
        child: Scaffold(
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
            condition: HomeCubit.get(context).lastOrderModel?.data! != null,
            builder: (context) => Column(
              children: [
                NotificationSearchTitle(
                  text: AppLocalizations.of(context)!.last_order,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        HomeCubit.get(context).lastOrderModel?.data!.length,
                    itemBuilder: (ctxt, index) {
                      return item_last_order(
                        model:
                            HomeCubit.get(context).lastOrderModel?.data![index],
                      );
                    },
                  ),
                ),
                FotterWidget(
                  model: HomeCubit.get(context).contactInfoModel?.data,
                  salla1: true,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class item_last_order extends StatefulWidget {
  DataLastOrder? model;
  bool isExpanded = true;
  item_last_order({Key? key, this.model}) : super(key: key);

  @override
  State<item_last_order> createState() => _item_last_orderState();
}

class _item_last_orderState extends State<item_last_order> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: InkWell(
          radius: 30,
          onTap: () {
            setState(() {
              widget.isExpanded = !widget.isExpanded;
            });
          },
          child: AnimatedCrossFade(
            firstChild: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  border: Border.all(width: 0.3, color: Colors.grey)
                  // color: Colors.red,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    // width: 70,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        color: Colors.grey.shade300),
                    child: TextUtils(
                        text: '${widget.model!.translatedStatus}',
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  TextUtils(
                      text: widget.model!.createdAt!.substring(0, 10),
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        300,
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0Xff054F86),
                          Color(0Xff61C089),
                        ],
                      ),
                    ),
                    child: widget.model!.type == 'buy_products'
                        ? InkWell(
                            onTap: () {
                              print(widget.model!.details!.products!.length);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => LastProductOrder(
                                        title: widget.model!.createdAt!
                                            .substring(0, 10),
                                        products:
                                            widget.model!.details!.products!,
                                      )));
                            },
                            child: const Icon(
                              Icons.shopping_cart_sharp,
                              color: Colors.white,
                            ),
                          )
                        : TextUtils(
                            text: '${widget.model!.translatedtype}',
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            secondChild: Container(
              // height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  border: Border.all(width: 0.3, color: Colors.grey)
                  // color: Colors.red,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    // width: 70,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0Xff054F86),
                          Color(0Xff61C089),
                        ],
                      ),
                    ),
                    child: TextUtils(
                        text: AppLocalizations.of(context)!.description,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SizedBox(
                      // height: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text(
                          widget.model!.details?.description ??
                              'No Description',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'Mikhak',
                              fontWeight: FontWeight.bold),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(5),
                  //   alignment: Alignment.center,
                  //   width: 80,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(
                  //       300,
                  //     ),
                  //     gradient: const LinearGradient(
                  //       colors: [
                  //         Color(0Xff054F86),
                  //         Color(0Xff61C089),
                  //       ],
                  //     ),
                  //   ),
                  //   child: widget.model!.type == 'buy_products'
                  //       ? InkWell(
                  //           onTap: () {
                  //             print(widget.model!.details!.products!.length);
                  //             Navigator.of(context).push(MaterialPageRoute(
                  //                 builder: (_) => LastProductOrder(
                  //                       title: widget.model!.createdAt!
                  //                           .substring(0, 10),
                  //                       products:
                  //                           widget.model!.details!.products!,
                  //                     )));
                  //           },
                  //           child: const Icon(
                  //             Icons.shopping_cart_sharp,
                  //             color: Colors.white,
                  //           ),
                  //         )
                  //       : TextUtils(
                  //           text: '${widget.model!.type}',
                  //           color: Colors.white,
                  //           fontSize: 10,
                  //           fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ),
            crossFadeState: widget.isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 1200),
          )),
    );
  }
}
// AnimatedCrossFade(
//                   firstChild: const Text(''),
//                   secondChild: TextUtils(
//                       text: widget.model!.details!.description!,
//                       color: Colors.grey,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                   crossFadeState: widget.isExpanded
//                       ? CrossFadeState.showFirst
//                       : CrossFadeState.showSecond,
//                   duration: const Duration(milliseconds: 1200),),
        