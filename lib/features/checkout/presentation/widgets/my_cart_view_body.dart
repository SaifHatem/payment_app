import 'package:final_pay/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:final_pay/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/images.dart';
import '../../../../core/utils/spacing.dart';
import 'order_info_item.dart';
import 'payment_method_buttom_sheet.dart';
import 'total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/cutsom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          verticalSpace(25),
          Expanded(child: Image.asset(Images.basketImage)),
          //SvgPicture.asset("assets/images/basket_image.svg")
          verticalSpace(25),

          const OrderInfoItem(
            title: 'Order Subtotal',
            value: '42.97',
          ),
          verticalSpace(3),
          const OrderInfoItem(
            title: 'Discount',
            value: '0',
          ),
          verticalSpace(3),
          const OrderInfoItem(
            title: 'Shipping',
            value: '8',
          ),
          //verticalSpace(17),
          const Divider(
            height: 34,
            thickness: 2,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(price: '50.97'),
          verticalSpace(17),

          CustomButton(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const PaymentDetailsView();
              // }));
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                    child: const PaymentMethodsButtomSheet(),
                  );
                },
              );
            },
            buttonText: 'Complete Payment',
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}
