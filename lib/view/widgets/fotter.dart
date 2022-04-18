import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/contact_info.dart';
import 'package:clinic/shared/util.dart';
import 'package:clinic/view/screens/cart/cart_screen.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class FotterWidget extends StatelessWidget {
  bool? salla1;
  DataContact? model;
  FotterWidget({Key? key, this.salla1 = false, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: const Image(
            matchTextDirection: true,
            image: AssetImage('assets/images/88.png'),
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var url = model!.facebook!;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: const Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var url = model!.instagram!;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: const Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var url = model!.mobileNumber!;
                      // if (await canLaunch(url)) {
                      await launch("tel:$url");
                      // } else {
                      // throw 'Could not launch $url';
                      // }
                    },
                    child: const Icon(
                      FontAwesomeIcons.phone,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  // Text(model?.mobileNumber ?? '',
                  //     style: const TextStyle(
                  //       color: Colors.white,
                  //     ))
                ],
              ),
              salla1! ? const salla() : const Text(''),
            ],
          ),
        )
      ],
    );
  }
}

class salla extends StatelessWidget {
  const salla({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: InkWell(
            onTap: () {
              HomeCubit.get(context).getcart();
              Navigator.of(context).pushReplacement(
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
                    return const CartScreen();
                  },
                ),
              );
            },
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                SvgPicture.asset(
                  'assets/images/shopping-cart.svg',
                  color: Colors.white,
                  matchTextDirection: true,
                  // height: 42,
                  width: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: HomeCubit.get(context).cart != null
                      ? CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.blue.shade900,
                          child: TextUtils(
                              text: '${HomeCubit.get(context).cart.length}',
                              // '${HomeCubit.get(context).showCartModel?.data?.cart?.length ?? ''}',
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        )
                      : const Text(''),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
