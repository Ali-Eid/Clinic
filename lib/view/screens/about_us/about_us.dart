import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/view/screens/test_shimmer/shimmer_home.dart';
import 'package:clinic/view/widgets/drawer_widget.dart';
import 'package:clinic/view/widgets/fotter.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

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
              condition: state is SuccessAboutUsState,
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Material(
                                elevation: 15,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Html(
                                      data: HomeCubit.get(context)
                                          .aboutUsModel!
                                          .data!
                                          .body),
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 110,
                            height: 40,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0Xff054F86),
                                    Color(0Xff61C089),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: TextUtils(
                                text: AppLocalizations.of(context)!.about_us,
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  FotterWidget(
                      model: HomeCubit.get(context).contactInfoModel!.data)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
