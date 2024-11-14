import '../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price',
          style: AppStyles.styleSemiBold24,
        ),
        Text(
          '\$$price',
          style: AppStyles.styleSemiBold24,
        ),
      ],
    );
  }
}
