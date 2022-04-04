// import 'package:buildcondition/buildcondition.dart';
// import 'package:clinic/applocal.dart';
// import 'package:clinic/logic/home/cubit/home_cubit.dart';
// import 'package:clinic/model/service_model.dart';
// import 'package:clinic/view/widgets/category_and_title.dart';
// import 'package:clinic/view/widgets/fotter.dart';
// import 'package:clinic/view/widgets/header_widget.dart';
// import 'package:clinic/view/widgets/notification_search_title.dart';
// import 'package:clinic/view/widgets/text_utils.dart';
// import 'package:clinic/view/widgets/title.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen2 extends StatelessWidget {
//   const HomeScreen2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocConsumer<HomeCubit, HomeState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Scaffold(
//             drawer: Drawer(),
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
//                 child: CircularProgressIndicator(color: Colors.green.shade400),
//               ),
//               condition: HomeCubit.get(context).main.isNotEmpty &&
//                   HomeCubit.get(context).other.isNotEmpty,
//               builder: (context) => Column(
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   NotificationSearchTitle(
//                     text: '${getLang(context, "home")}',
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     flex: HomeCubit.get(context).main.length > 3 ? 2,
//                     child: GridView.builder(
//                         itemCount: HomeCubit.get(context).main.length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                         ),
//                         itemBuilder: (ctxt, index) {
//                           return CategoryandTitle2(
//                             model: HomeCubit.get(context).main[index],
//                             ontap: () {},
//                           );
//                         }),
//                   ),
//                   Align(
//                     alignment:
//                         AppLocale.of(context).locale!.languageCode == "ar"
//                             ? Alignment.centerRight
//                             : Alignment.centerLeft,
//                     child: TitleWidget(
//                         text: '${getLang(context, "otherservice")}'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: GridView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: HomeCubit.get(context).other.length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           mainAxisSpacing: 3,
//                         ),
//                         itemBuilder: (ctxt, index) {
//                           return CategoryandTitle2(
//                             model: HomeCubit.get(context).other[index],
//                             ontap: () {},
//                           );
//                         }),
//                   ),
//                   FotterWidget(),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CategoryandTitle2 extends StatelessWidget {
//   GestureTapCallback? ontap;
//   DataService model;
//   CategoryandTitle2({
//     Key? key,
//     required this.ontap,
//     required this.model,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: ontap,
//           child: Container(
//             width: 80,
//             height: 80,
//             padding: EdgeInsets.all(14),
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   Colors.green,
//                   Colors.blue.shade900,
//                 ]),
//                 borderRadius: BorderRadius.circular(20)),
//             // child: Image(
//             //   image: NetworkImage('${model.icon}'),
//             // ),
//           ),
//         ),
//         TextButton(
//             onPressed: ontap,
//             child: TextUtils(
//               text: '${model.name}',
//               color: Colors.blue.shade900,
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ))
//       ],
//     );
//   }
// }
