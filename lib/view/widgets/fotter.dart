import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/contact_info.dart';
import 'package:clinic/shared/util.dart';
import 'package:clinic/view/screens/cart/cart_screen.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

class FotterWidget extends StatelessWidget {
  bool? salla1;
  DataContact? model;
  FotterWidget({Key? key, this.salla1 = false, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Image(
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
                  InkWell(
                    onTap: () {
                      // Utils.openLink(url: '${model!.facebook}');
                    },
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {
                      print('object');
                    },
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {
                      print('object');
                    },
                    child: Icon(
                      FontAwesomeIcons.phone,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text('${model!.mobileNumber}',
                      style: TextStyle(
                        color: Colors.white,
                      ))
                ],
              ),
              salla1! ? salla() : Text(''),
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
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
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
                    return CartScreen();
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
                  // height: 42,
                  width: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.blue.shade900,
                    child: TextUtils(
                        text:
                            '${HomeCubit.get(context).showCartModel?.data!.cart!.length ?? '0'}',
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
