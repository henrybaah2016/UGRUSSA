import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class CardPayment extends StatefulWidget {
  CardPayment({Key? key}) : super(key: key);

  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.white,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [

            GooglePayButton(
              paymentConfigurationAsset:
              'default_payment_profile_google_pay.json',
              paymentItems: _paymentItems,
              style: GooglePayButtonStyle.black,
              type: GooglePayButtonType.pay,
              margin: const EdgeInsets.only(top: 15.0),
              onPaymentResult: onGooglePayResult,
              loadingIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            ApplePayButton(
              paymentConfigurationAsset: 'default_payment_profile_apple_pay.json',
              paymentItems: _paymentItems,
              style: ApplePayButtonStyle.black,
              type: ApplePayButtonType.buy,
              margin: const EdgeInsets.only(top: 15.0),
              onPaymentResult: onApplePayResult,
              loadingIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 15)
          ],

      ),
    );
  }
}