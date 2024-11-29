import 'package:final_pay/core/utils/api_keys.dart';
import 'package:final_pay/core/utils/api_service.dart';
import 'package:final_pay/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/checkout/data/models/payment_intenet_model/payment_intenet_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntenetModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    var paymentIntenetModel = PaymentIntenetModel.fromJson(response.data);
    return paymentIntenetModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Seif',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntenetModel =
        await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntenetModel.clientSecret!);
    await displayPaymentSheet();
  }
}
