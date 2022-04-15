import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/cart/show_cart.dart';
import 'package:clinic/model/sub_category_model.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartCategoryItemWidget extends StatefulWidget {
  GestureTapCallback? ontap;
  // DataSubCategory? model;
  Cart? modelCart;

  CartCategoryItemWidget({Key? key, this.ontap, this.modelCart})
      : super(key: key);

  @override
  State<CartCategoryItemWidget> createState() => _CartCategoryItemWidgetState();
}

class _CartCategoryItemWidgetState extends State<CartCategoryItemWidget> {
  int? quantityorg;
  // int? quantity = 1;

  @override
  Widget build(BuildContext context) {
    quantityorg = widget.modelCart!.cartProduct!.quantity;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: widget.ontap,
          child: Column(
            children: [
              Stack(
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
                        text: widget.modelCart?.name ?? 'Name',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 10,
                color: Colors.transparent,
                shadowColor: Colors.grey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width: 180,
                  height: 30,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0Xff054F86),
                        Color(0Xff61C089),
                      ], begin: Alignment.topLeft, end: Alignment.topRight),
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(30),
                          bottomStart: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              // quantity = quantityorg;
                              if (widget.modelCart!.cartProduct!.quantity! <
                                  2) {
                                widget.modelCart!.cartProduct!.quantity = 1;
                              } else {
                                widget.modelCart!.cartProduct!.quantity =
                                    widget.modelCart!.cartProduct!.quantity! -
                                        1;
                              }
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down_sharp,
                              color: Colors.white)),
                      TextUtils(
                        // text: '${widget.modelCart?.cartProduct!.quantity}',
                        text: widget.modelCart!.cartProduct!.quantity! > 0
                            ? '${widget.modelCart!.cartProduct!.quantity}'
                            : '1',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              widget.modelCart!.cartProduct!.quantity =
                                  widget.modelCart!.cartProduct!.quantity! + 1;
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_up_sharp,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 10,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.transparent,
                shadowColor: Colors.grey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width: 140,
                  height: 25,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0Xff054F86),
                        Color(0Xff61C089),
                      ], begin: Alignment.topLeft, end: Alignment.topRight),
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(30),
                          bottomStart: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextUtils(
                          // text: '${widget.modelCart!.price! * quantityorg!}  ',
                          text: widget.modelCart!.cartProduct!.quantity! > 0
                              ? '${widget.modelCart!.price! * widget.modelCart!.cartProduct!.quantity!}'
                              : '${widget.modelCart!.price!}',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          HomeCubit.get(context).deleteItem(
                              id: widget.modelCart!.cartProduct!.id);
                        },
                        child: TextUtils(
                            text: AppLocalizations.of(context)!.delete,
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              // widget.modelCart!.cartProduct!.quantity! == quantityorg!

              BuildCondition(
                fallback: (context) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                condition: state is! LoadingAddquantitytState,
                builder: (context) => InkWell(
                  onTap: () {
                    // setState(() {
                    HomeCubit.get(context).updatequantity(
                        id: widget.modelCart!.cartProduct!.id,
                        quantity:
                            widget.modelCart!.cartProduct!.quantity.toString());
                    //  HomeCubit.get(context).getcart();
                    // });
                  },
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 10,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.transparent,
                    shadowColor: Colors.grey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      width: 100,
                      height: 25,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0Xff054F86),
                            Color(0Xff61C089),
                          ], begin: Alignment.topLeft, end: Alignment.topRight),
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(30),
                              bottomStart: Radius.circular(30))),
                      child: TextUtils(
                          text: AppLocalizations.of(context)!.update,
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
              // : Text('')
            ],
          ),
        );
      },
    );
  }
}
