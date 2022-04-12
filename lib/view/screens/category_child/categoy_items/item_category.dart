// import 'package:buildcondition/buildcondition.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:clinic/logic/home/cubit/home_cubit.dart';
// import 'package:clinic/model/product_model.dart';
// import 'package:clinic/view/screens/item/item.dart';
// import 'package:clinic/view/widgets/drawer_widget.dart';
// import 'package:clinic/view/widgets/fotter.dart';
// import 'package:clinic/view/widgets/grid_custom.dart';
// import 'package:clinic/view/widgets/header_widget.dart';
// import 'package:clinic/view/widgets/notification_search_title.dart';
// import 'package:clinic/view/widgets/text_utils.dart';
// import 'package:easy_loader/easy_loader.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';

// class ItemCategory extends StatelessWidget {
//   const ItemCategory({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocConsumer<HomeCubit, HomeState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Scaffold(
//             drawer: DrawerPage(),
//             appBar: AppBar(
//               flexibleSpace: HeaderWidget(),
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               leading: Builder(builder: (context) {
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: IconButton(
//                     onPressed: () => Scaffold.of(context).openDrawer(),
//                     icon: Icon(
//                       Icons.menu,
//                       color: Colors.black,
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             body: BuildCondition(
//               fallback: (context) => Center(
//                 child: EasyLoader(
//                   image: AssetImage('assets/images/logo.png'),
//                   backgroundColor: Colors.white,
//                   // iconSize: 30,
//                   iconColor: Color(0Xff054F86),
//                 ),
//               ),
//               condition: true,
//               builder: (context) => BuildCondition(
//                 fallback: (context) => Center(
//                   child: TextUtils(
//                       text: 'No Product Data',
//                       color: Colors.green.shade400,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 condition: true,
//                 builder: (context) => Column(
//                   children: [
//                     NotificationSearchTitle(text: 'name'),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     BuildCondition(
//                       fallback: (context) => Expanded(
//                           child: Lottie.asset('assets/images/no-data.json',
//                               width: 200, height: 100)),
//                       condition: true,
//                       builder: (context) => Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 15),
//                           child: Expanded(
//                               child: GridView.builder(
//                             itemCount: 12,
//                             // HomeCubit.get(context)
//                             //     .productModel!
//                             //     .data!
//                             //     .length,
//                             physics: BouncingScrollPhysics(),
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
//                               itemCount: 12,
//                               // HomeCubit.get(context)
//                               //     .productModel!
//                               //     .data!
//                               //     .length,
//                               crossAxisCount: 2,
//                             ),
//                             itemBuilder: (ctxt, index) {
//                               return item_categ(
//                                   // model: HomeCubit.get(context)
//                                   //     .productModel!
//                                   //     .data![index],
//                                   );
//                             },
//                           )),
//                         ),
//                       ),
//                     ),
//                     FotterWidget(
//                       salla1: true,
//                       // model: HomeCubit.get(context).contactInfoModel!.data,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class item_categ extends StatelessWidget {
//   DataProduct? model;
//   item_categ({Key? key, this.model}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Stack(
//         alignment: AlignmentDirectional.bottomStart,
//         children: [
//           Container(
//             width: 165,
//             height: 165,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               // border: Border.all(width: 1),
//               gradient: LinearGradient(colors: [
//                 Color(0Xff054F86),
//                 Color(0Xff61C089),
//               ], begin: Alignment.topLeft, end: Alignment.topRight),
//             ),
//             child: Container(
//               width: 160,
//               height: 160,
//               color: Colors.white,
//               child: CachedNetworkImage(
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 // imageUrl: "${model.icon}",
//                 imageUrl:
//                     'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
//                 placeholder: (context, url) => Center(
//                   child:
//                       CircularProgressIndicator(color: Colors.green.shade400),
//                 ),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             // alignment: Alignment.center,
//             width: 125,
//             // height: 25,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   Color(0Xff054F86),
//                   Color(0Xff61C089),
//                 ], begin: Alignment.topLeft, end: Alignment.topRight),
//                 borderRadius:
//                     BorderRadiusDirectional.only(topEnd: Radius.circular(30))),
//             child: TextUtils(
//                 text: 'model!.name!',
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold),
//           )
//         ],
//       ),
//     );
//   }
// }
