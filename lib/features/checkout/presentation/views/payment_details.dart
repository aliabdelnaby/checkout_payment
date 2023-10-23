import 'package:flutter/material.dart';
import 'package:flutter_paymob/core/widgets/custom_appbar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
    );
  }
}
