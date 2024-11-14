import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  bool isBack = false;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cardHolderNameController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void toggleCardView() {
    setState(() {
      isBack = !isBack;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: toggleCardView,
            child: CreditCard(
              cardNumber: _cardNumberController.text,
              cardExpiry: _expiryDateController.text,
              cardHolderName: _cardHolderNameController.text,
              cvv: _cvvController.text,
              showBackSide: isBack,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: widget.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _cardNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    hintText: '1234 5678 9012 3456',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your card number';
                    }
                    if (value.length < 16) {
                      return 'Card number must be 16 digits';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                TextFormField(
                  controller: _expiryDateController,
                  decoration: const InputDecoration(
                    labelText: 'Expiry Date',
                    hintText: 'MM/YY',
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the expiry date';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                TextFormField(
                  controller: _cardHolderNameController,
                  decoration: const InputDecoration(
                    labelText: 'Card Holder Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the card holder name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                TextFormField(
                  controller: _cvvController,
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                    hintText: '123',
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter CVV';
                    }
                    if (value.length != 3) {
                      return 'CVV must be 3 digits';
                    }
                    return null;
                  },
                  onTap: () {
                    setState(() {
                      isBack = true;
                    });
                  },
                  onEditingComplete: () {
                    setState(() {
                      isBack = false;
                    });
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
