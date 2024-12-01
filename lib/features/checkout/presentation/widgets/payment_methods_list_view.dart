// import '../../../../core/utils/assets.dart';
// import 'payment_method_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PaymentMethodsListView extends StatefulWidget {
//   const PaymentMethodsListView(
//       {super.key, required this.onMethodSelected});

//   final ValueChanged<int> onMethodSelected;

//   @override
//   State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
// }

// class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
//   final List<String> paymentMethodsImages = const [
//     Assets.assetsImagesCredit,
//     Assets.assetsImagesPaypal,
//   ];
//    int activeIndex;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 62.h,
//       child: ListView.builder(
//         itemCount: paymentMethodsImages.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0.w),
//             child: GestureDetector(
//               onTap: () {
//                 widget.onMethodSelected(index);
//                 activeIndex = index;
//                 setState(() {});
//               },
//               child: PaymentMethodItem(
//                 isActive:activeIndex == index,
//                 image: paymentMethodsImages[index],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:final_pay/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'payment_method_item.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({
    super.key,
    required this.activeIndex,
    required this.onMethodSelected,
  });

  final int activeIndex;
  final ValueChanged<int> onMethodSelected;

  @override
  Widget build(BuildContext context) {
    const List<String> paymentMethodsImages = [
      Assets.assetsImagesCredit,
      Assets.assetsImagesPaypal,
    ];

    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        itemCount: paymentMethodsImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: GestureDetector(
              onTap: () {
                onMethodSelected(index);
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                image: paymentMethodsImages[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
