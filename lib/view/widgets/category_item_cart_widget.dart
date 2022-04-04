import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/model/cart/show_cart.dart';
import 'package:clinic/model/sub_category_model.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class CartCategoryItemWidget extends StatelessWidget {
  GestureTapCallback? ontap;
  // DataSubCategory? model;
  Cart? modelCart;

  CartCategoryItemWidget({Key? key, this.ontap, this.modelCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
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
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                width: 190,
                height: 30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0Xff054F86),
                      Color(0Xff61C089),
                    ], begin: Alignment.topLeft, end: Alignment.topRight),
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(30),
                        topStart: Radius.circular(30))),
                child: TextUtils(
                    text: modelCart?.name ?? 'Name',
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              width: 180,
              height: 30,
              decoration: BoxDecoration(
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
                  Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
                  TextUtils(
                    text: '${modelCart?.pivot!.quantity}',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(
                    Icons.arrow_drop_up_sharp,
                    color: Colors.white,
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              width: 140,
              height: 25,
              decoration: BoxDecoration(
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
                      text: '${modelCart?.price}',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {},
                    child: TextUtils(
                        text: 'Delete',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
