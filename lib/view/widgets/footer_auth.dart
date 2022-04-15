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

class FotterAuthWidget extends StatelessWidget {
  bool? salla1;
  DataContact? model;
  FotterAuthWidget({Key? key, this.salla1 = false, this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: const Image(
        matchTextDirection: true,
        image: AssetImage('assets/images/88.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
