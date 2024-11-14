import '../../../../core/utils/assets.dart';
import 'payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsImages = const [
    Assets.assetsImagesCredit,
    Assets.assetsImagesPaypal,
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                activeIndex = index;
                setState(() {});
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
