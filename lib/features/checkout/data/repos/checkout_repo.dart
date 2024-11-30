import 'package:dartz/dartz.dart';
import 'package:final_pay/features/checkout/data/models/payment_intent_input_model.dart';

import '../../../../core/errors/failures.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
