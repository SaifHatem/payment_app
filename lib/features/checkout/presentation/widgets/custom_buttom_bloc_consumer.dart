import 'dart:developer';

import 'package:final_pay/core/utils/api_keys.dart';
import 'package:final_pay/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:final_pay/features/checkout/data/models/amount_model/details.dart';
import 'package:final_pay/features/checkout/data/models/item_list_model/item.dart';
import 'package:final_pay/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:final_pay/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:final_pay/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:final_pay/features/checkout/presentation/views/thankyou_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //         amount: 1000,
            //         currency: 'USD',
            //         customerId: 'cus_RJbWQrSaoXEkdV');
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);

            var transactionData = getTransactionData();
            executePaypalPayment(context, transactionData);
          },
          isLoading: state is PaymentLoading ? true : false,
          buttonText: 'Continue',
        );
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecret,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
    );

    List<OrderItemModel> orders = [
      OrderItemModel(currency: "USD", name: 'Apple', price: "4", quantity: 10),
      OrderItemModel(currency: "USD", name: 'Egg', price: "5", quantity: 12),
    ];

    var itemList = ItemListModel(orders: orders);
    return (amount: amount, itemList: itemList);
  }
}
