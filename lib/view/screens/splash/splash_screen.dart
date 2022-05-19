// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:clinic/view/widgets/text_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class SplashScreen extends StatelessWidget {
//   Widget? startWidget;

//   SplashScreen({this.startWidget});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Column(
//         children: [
//           Container(
//             width: 200,
//             height: 200,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/logo.png'))),
//           ),
//           TextUtils(
//               text: AppLocalizations.of(context)!.logo,
//               color: const Color(0Xff054F86),
//               fontSize: 23,
//               fontWeight: FontWeight.bold)
//         ],
//       ),

//       nextScreen: startWidget!,
//       splashTransition: SplashTransition.fadeTransition,
//       // splashTransition: SplashTransition.rotationTransition,
//       // pageTransitionType: PageTransitionType.leftToRightWithFade,
//       splashIconSize: 250,
//       disableNavigation: false,
//       duration: 3000,
//       animationDuration: const Duration(seconds: 3),
//       centered: true,

//       // backgroundColor: Colors.red,
//     );
//   }
// }
