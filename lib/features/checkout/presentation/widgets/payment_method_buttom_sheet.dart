import 'package:final_pay/features/checkout/presentation/widgets/custom_buttom_bloc_consumer.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/spacing.dart';
import 'payment_methods_list_view.dart';

class PaymentMethodsButtomSheet extends StatefulWidget {
  const PaymentMethodsButtomSheet({super.key});

  @override
  State<PaymentMethodsButtomSheet> createState() =>
      _PaymentMethodsButtomSheetState();
}

class _PaymentMethodsButtomSheetState extends State<PaymentMethodsButtomSheet> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(12),
          PaymentMethodsListView(
            activeIndex: activeIndex,
            onMethodSelected: (index) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          verticalSpace(32),
          CustomButtomBlockConsumer(activeIndex: activeIndex),
        ],
      ),
    );
  }
}
