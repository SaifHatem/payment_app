import '../../../../core/utils/assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 23),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(Assets.assetsImagesLogo),
          horizontalSpace(23),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Credit Card\n',
                  style: AppStyles.styleRegular18,
                ),
                TextSpan(
                  text: 'Mastercard **78',
                  style: AppStyles.styleRegular18.copyWith(fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
