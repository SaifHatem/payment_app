import 'package:dartz/dartz.dart';
import 'package:final_pay/core/errors/failures.dart';
import 'package:final_pay/core/utils/stripe_service.dart';
import 'package:final_pay/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:final_pay/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeService stripeService = StripeService();

  CheckoutRepoImpl();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
