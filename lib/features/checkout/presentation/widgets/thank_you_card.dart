import 'package:flutter/material.dart';
import 'package:flutter_paymob/core/utils/styles.dart';
import 'package:flutter_paymob/features/checkout/presentation/widgets/credit_card_info_widget.dart';
import 'package:flutter_paymob/features/checkout/presentation/widgets/payment_item_info.dart';
import 'package:flutter_paymob/features/checkout/presentation/widgets/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 66, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(height: 42),
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(
              title: "Time",
              value: '10:15 AM',
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(
              title: "To",
              value: 'Sam Louis',
            ),
            const Divider(
              thickness: 2,
              height: 60,
            ),
            const TotalPrice(
              titleLarge: "Total",
              value: '\$50.97',
            ),
            const SizedBox(height: 30),
            const CreditCardInfoWidget(),
          ],
        ),
      ),
    );
  }
}
