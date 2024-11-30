import 'package:device_preview/device_preview.dart';
import 'package:final_pay/core/utils/api_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishableKey;
  await ScreenUtil.ensureScreenSize();
  runApp(
    const CheckoutApp(),

    // DevicePreview(
    //   builder: (context) => const CheckoutApp(),
    //   enabled: !kReleaseMode,
    // ),
  );
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyCartView(),
      ),
    );
  }
}
