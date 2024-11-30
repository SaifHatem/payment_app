import 'package:flutter/material.dart';

import '../../../../core/utils/spacing.dart';
import 'custom_buttom_bloc_consumer.dart';
import 'payment_methods_list_view.dart';

class PaymentMethodsButtomSheet extends StatelessWidget {
  const PaymentMethodsButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(12),
          const PaymentMethodsListView(),
          verticalSpace(32),
          const CustomButtomBlockConsumer()
        ],
      ),
    );
  }
}
