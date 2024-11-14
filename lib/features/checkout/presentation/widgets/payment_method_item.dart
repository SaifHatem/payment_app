import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatefulWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
    required this.image,
  });

  final bool isActive;
  final String image;

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103.w,
      height: 62.h,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            color: widget.isActive ? const Color(0xff34A853) : Colors.white,
            spreadRadius: 0,
            offset: Offset.zero,
            blurRadius: 2,
          ),
        ],
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: widget.isActive ? const Color(0xff34A853) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            widget.image,
            // height: 24,
            // fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
