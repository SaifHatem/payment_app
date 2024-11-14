import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/styles.dart';
import 'card_info_widget.dart';
import 'payment_item_info.dart';
import 'total_price.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankyouCardInfo extends StatelessWidget {
  const ThankyouCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xffEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0 + 16, left: 22, right: 23),
        child: Column(
          children: [
            Text(
              'Thank You!',
              style: AppStyles.styleMedium25,
            ),
            Text(
              'Your transaction was successful',
              style: AppStyles.styleRegular20,
            ),
            verticalSpace(42),
            const PaymentItemInfo(title: 'Date', value: '01/24/2023'),
            verticalSpace(20),
            const PaymentItemInfo(title: 'Time', value: '10:15 AM'),
            verticalSpace(20),
            const PaymentItemInfo(title: 'To', value: 'Sam Louis'),
            const Divider(
              height: 34,
              thickness: 2,
              color: Color(0xffC7C7C7),
            ),
            const TotalPrice(price: '50.97'),
            verticalSpace(17),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 60,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.5,
                        color: Color(0xff34a853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: AppStyles.styleSemiBold24.copyWith(
                        color: const Color(0xff34a853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(
                ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29)
          ],
        ),
      ),
    );
  }
}
