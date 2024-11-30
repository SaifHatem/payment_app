import 'dart:developer';

import 'package:final_pay/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:final_pay/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:final_pay/features/checkout/presentation/views/thankyou_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/cutsom_button.dart';

class CustomButtomBlockConsumer extends StatelessWidget {
  const CustomButtomBlockConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ThankyouView();
              },
            ),
          );
        } else if (state is PaymentFailure) {
          Navigator.pop(context);
          log(state.errorMessage);
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                    amount: 1000,
                    currency: 'USD',
                    customerId: 'cus_RJbWQrSaoXEkdV');
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
          buttonText: 'Continue',
        );
      },
    );
  }
}
