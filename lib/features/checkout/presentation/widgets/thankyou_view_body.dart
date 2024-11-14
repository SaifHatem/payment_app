import 'custom_check_icon.dart';
import 'custom_dashed_lined.dart';
import 'thankyou_info.dart';
import 'package:flutter/material.dart';

class ThankyouViewBody extends StatelessWidget {
  const ThankyouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankyouCardInfo(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            //! حطينا الشمال واليمين  عشام كاننا حطينا مساحة للصف عشان استخدمنا اكسبانديد
            left: 0,
            right: 0,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8 + 16.0),
              child: CustomDashedLine(),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
