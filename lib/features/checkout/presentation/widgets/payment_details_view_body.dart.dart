// import 'dart:developer';

// import '../../../../core/utils/widgets/cutsom_button.dart';
// import '../views/thankyou_view.dart';
// import 'custom_credit_card.dart';
// import 'payment_methods_list_view.dart';
// import 'package:flutter/material.dart';

// class PaymentDetailsViewBody extends StatefulWidget {
//   const PaymentDetailsViewBody({super.key});

//   @override
//   State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
// }

// class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
//   final GlobalKey<FormState> formKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         const SliverToBoxAdapter(child: PaymentMethodsListView()),
//         const SliverToBoxAdapter(
//           child: SizedBox(
//             height: 34,
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: CustomCreditCard(
//             formKey: formKey,
//             // Pass the callback here
//           ),
//         ),
//         SliverFillRemaining(
//           hasScrollBody: false,
//           child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.only(bottom: 6.0, right: 20, left: 20),
//                 child: CustomButton(
//                     buttonText: 'Pay',
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         formKey.currentState!.save();
//                         log('saved');
//                       } else {
//                         Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (context) {
//                           return const ThankyouView();
//                         }));
//                       }
//                     }
//                     // Trigger form submit on button press
//                     ),
//               )),
//         )
//       ],
//     );
//   }
// }
