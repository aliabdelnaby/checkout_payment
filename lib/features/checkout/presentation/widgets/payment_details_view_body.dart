import 'package:flutter/material.dart';
import 'package:flutter_paymob/core/widgets/custom_btn.dart';
import 'package:flutter_paymob/features/checkout/presentation/widgets/custom_credit_card.dart';
import 'package:flutter_paymob/features/checkout/presentation/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverToBoxAdapter(child: CustomCreditCard()),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.0, left: 16, right: 16),
              child: CustomButton(
                text: "Pay",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
