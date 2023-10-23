import 'package:flutter/material.dart';
import 'package:flutter_paymob/features/checkout/presentation/widgets/payment_details_item.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});
  final List<String> paymentMethodsItem = const [
    "assets/images/card.svg",
    "assets/images/paypal.svg",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodsItem.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PaymentMethodItem(
                isActive: false, image: paymentMethodsItem[index]),
          );
        },
      ),
    );
  }
}
