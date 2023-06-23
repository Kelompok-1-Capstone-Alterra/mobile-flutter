import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../keys/navigator_keys.dart';
import '../../themes/custom_color.dart';

enum SnackbarType { success, error, info }

class SnackbarCustomProvider extends ChangeNotifier {
//
//--------------------------------------------------------------------------------
  Color succesType = const Color.fromARGB(255, 36, 167, 84);
  Color errorType = error[300]!;
  Color infoType = information[300]!;

//--------------------------------------------------------------------------------
  bool isShowing = false;
  bool isNetworkSnackbarShowing = false;

  Duration delayNormal = const Duration(milliseconds: 5500);
  Duration delayReset = const Duration(milliseconds: 5500);
//--------------------------------------------------------------------------------
//

  void resetShowingStatus() async {
    isShowing = true;
    await Future.delayed(delayReset);
    isShowing = false;
    notifyListeners();
  }

//   void resetShowingStatusExtend({required Duration durations}) async {
//     isShowing = true;
//     await Future.delayed(durations);
//     isShowing = false;

//     print("status kereset false");
//     notifyListeners();
//   }

// //===================================================================================================================//
//   void showSnackbarNetworkError({required Duration durations}) {
//     double screenWidth =
//         MediaQuery.of(navigatorKeys.currentContext!).size.width;

//     if (isShowing == false) {
//       // print("snackbar build");
//       AnimatedSnackBar(
//           duration: durations,
//           mobilePositionSettings: const MobilePositionSettings(
//             topOnAppearance: 100,
//             // topOnAppearance: 80,
//           ),
//           builder: (BuildContext context) {
//             resetShowingStatusExtend(durations: durations);
//             return Container(
//               width: screenWidth * 0.62,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     offset: const Offset(0, 5),
//                     // offset: Offset(10, 10),
//                     color: Colors.black.withOpacity(0.25), //New
//                     blurRadius: 10.0,
//                   )
//                 ],
//                 color: const Color(0xFF4B5563),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(
//                     Icons.wifi_off_rounded,
//                     size: screenWidth * 0.08,
//                     color: const Color.fromARGB(255, 233, 235, 238),
//                   ),
//                   SizedBox(
//                     width: screenWidth * 0.45,
//                     child: const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Koneksi bermasalah",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 13,
//                               color: Color.fromARGB(255, 233, 235, 238)),
//                         ),
//                         AutoSizeText(
//                           "Periksa kembali koneksi anda",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               height: 1.25,
//                               fontWeight: FontWeight.normal,
//                               fontSize: 10,
//                               color: Color.fromARGB(255, 233, 235, 238)),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }).show(navigatorKeys.currentContext!);
//       // show(navigatorKeys.currentContext!)
//     }
//   }

//===================================================================================================================//

  void showSnackbarCustom({
    required String title,
    required String description,
    required IconData iconData,
    required Color backgorundColor,
    required Color foregrondColor,
  }) {
    double screenWidth =
        MediaQuery.of(navigatorKeys.currentContext!).size.width;

    if (isShowing == false) {
      AnimatedSnackBar(
          duration: delayNormal,
          mobilePositionSettings: const MobilePositionSettings(
            topOnAppearance: 40,
          ),
          builder: (BuildContext context) {
            resetShowingStatus();
            return Container(
              width: screenWidth * 0.62,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    // offset: Offset(10, 10),
                    color: Colors.black.withOpacity(0.25), //New
                    blurRadius: 10.0,
                  )
                ],
                color: backgorundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    iconData,
                    size: screenWidth * 0.08,
                    color: foregrondColor,
                  ),
                  SizedBox(
                    // color: Colors.purple,
                    width: screenWidth * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: foregrondColor),
                        ),
                        AutoSizeText(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              height: 1.25,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              color: foregrondColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).show(navigatorKeys.currentContext!);
    }
  }

//===================================================================================================================//

  void showSnackbarBasic({
    required String title,
    required String description,
    required SnackbarType type,
  }) {
    double screenWidth =
        MediaQuery.of(navigatorKeys.currentContext!).size.width;

    if (isShowing == false) {
      AnimatedSnackBar(
        duration: delayNormal,
        mobilePositionSettings: const MobilePositionSettings(
          topOnAppearance: 50,
        ),
        builder: ((context) {
          switch (type) {
            case SnackbarType.success:
              {
                resetShowingStatus();
                return Container(
                  width: screenWidth * 0.62,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        // offset: Offset(10, 10),
                        color: Colors.black.withOpacity(0.25), //New
                        blurRadius: 10.0,
                      )
                    ],
                    color: succesType,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: screenWidth * 0.08,
                        color: const Color.fromARGB(255, 233, 235, 238),
                      ),
                      SizedBox(
                        // color: Colors.purple,
                        width: screenWidth * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 233, 235, 238)),
                            ),
                            AutoSizeText(
                              description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  height: 1.25,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 233, 235, 238)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

            case SnackbarType.error:
              {
                resetShowingStatus();
                return Container(
                  width: screenWidth * 0.62,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        // offset: Offset(10, 10),
                        color: Colors.black.withOpacity(0.25), //New
                        blurRadius: 10.0,
                      )
                    ],
                    color: errorType,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.error_rounded,
                        size: screenWidth * 0.08,
                        color: const Color.fromARGB(255, 233, 235, 238),
                      ),
                      SizedBox(
                        // color: Colors.purple,
                        width: screenWidth * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 233, 235, 238)),
                            ),
                            AutoSizeText(
                              description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  height: 1.25,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 233, 235, 238)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

            case SnackbarType.info:
              {
                resetShowingStatus();
                return Container(
                  width: screenWidth * 0.62,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        // offset: Offset(10, 10),
                        color: Colors.black.withOpacity(0.25), //New
                        blurRadius: 10.0,
                      )
                    ],
                    color: infoType,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.info,
                        size: screenWidth * 0.08,
                        color: const Color.fromARGB(255, 233, 235, 238),
                      ),
                      SizedBox(
                        width: screenWidth * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 233, 235, 238)),
                            ),
                            AutoSizeText(
                              description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  height: 1.25,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 233, 235, 238)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
          }
        }),
      ).show(navigatorKeys.currentContext!);
    }
  }
}
