import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/model/sub_category_model.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  GestureTapCallback? ontap;
  DataSubCategory model;

  CategoryItemWidget({Key? key, this.ontap, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print('sub width  $width');
    print('sub height  $height');
    return InkWell(
      onTap: ontap,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            width: width / 2.3,
            height: height / 4.9,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              // border: Border.all(width: 1),
              gradient: LinearGradient(colors: [
                Color(0Xff054F86),
                Color(0Xff61C089),
              ], begin: Alignment.topLeft, end: Alignment.topRight),
            ),
            child: Container(
              width: width / 2.4,
              height: height / 5.1,
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
            width: width / 3,
            // height: 25,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0Xff054F86),
                  Color(0Xff61C089),
                ], begin: Alignment.topLeft, end: Alignment.topRight),
                borderRadius:
                    BorderRadiusDirectional.only(topEnd: Radius.circular(30))),
            child: TextUtils(
                text: model.name!,
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
