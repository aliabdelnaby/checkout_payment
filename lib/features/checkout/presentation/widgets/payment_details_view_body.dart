import 'package:flutter/material.dart';
import 'package:flutter_paymob/features/checkout/presentation/widgets/payment_details_item.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PaymentMethodItem(
          isActive: false,
        ),
      ],
    );
  }
}
