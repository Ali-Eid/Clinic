// import 'package:flutter/material.dart';

// class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => throw UnimplementedError();
// }
// //  AppBarWidget({ Key? key }) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       flexibleSpace: Stack(
//         fit: StackFit.passthrough,
//         children: [
//           const Image(
//             image: AssetImage('assets/images/xxxxxxx (1).png'),
//             fit: BoxFit.fill,
//             height: 60,
//           ),
//           Container(
//             padding: EdgeInsets.only(
//                 right: MediaQuery.of(context).size.width * 0.15),
//             alignment: Alignment.centerRight,
//             child: const Image(
//               image: AssetImage('assets/images/xxxxxxx (2).png'),
//               // width: 40,
//               height: 40,
//               // fit: BoxFit.fill,
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       leading: Builder(builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.only(top: 20),
//           child: IconButton(
//             onPressed: () => Scaffold.of(context).openDrawer(),
//             icon: const Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//           ),
//         );
//       }),
//     ),
//   );
// }
