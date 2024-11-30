import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:final_pay/core/utils/api_keys.dart';
import 'package:final_pay/core/utils/api_service.dart';
import 'package:final_pay/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:final_pay/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/checkout/data/models/init_payment_sheet_input_model.dart';
import '../../features/checkout/data/models/payment_intenet_model/payment_intenet_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntenetModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    //String jsonString = jsonEncode(paymentIntentInputModel.toJson());
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    var paymentIntenetModel = PaymentIntenetModel.fromJson(response.data);
    return paymentIntenetModel;
  }

  Future<void> initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Seif',
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerId: initPaymentSheetInputModel.customerId,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
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
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntenetModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    //String jsonString = jsonEncode(paymentIntentInputModel.toJson());
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys
            .secretKey, //! هنا ملهاش لازمة بس عشان منعدلش كتير ونخليخا نوت ؤيكوايرد
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2024-11-20.acacia',
        });
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
